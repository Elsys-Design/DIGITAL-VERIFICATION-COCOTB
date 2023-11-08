from enum import Enum
import random
import copy
from dataclasses import dataclass
import logging

from . import utils
from .fill_strategy import FillStrategy
from .logger import logger


class Encoding(Enum):
    ASCII = 0
    BINARY = 1


@dataclass
class DataFormat:
    """
    Represents the format of a Data.
    This has no implications on the actual transfers but helps:
        - determine how to understand the Data (is_big_endian, word_size)
        - determine how to print back the Data (tlast_char, encoding, ...)
    """
    word_size : int = 4
    is_big_endian : bool = True
    encoding : Encoding = Encoding.ASCII
    tlast_char : str = '!'
    addr_size : int = 4

    def is_supported(self):
        """
        Returns True if the DataFormat is currently supported.
        This method should be updated as functionalities are added.
        """
        return self.is_big_endian == True and self.encoding == Encoding.ASCII and self.tlast_char == '!'


@dataclass()
class Data:
    """
    Represents either:
    - an AXI Burst
    - multiple consecutive AXI-Lite transfers
    - multiple AXI-Stream 'transfers' with an optional tlast during the last transfer

    In any case, the transfer is continuous (for AXI/AXI-Lite, the addresses increment by the word size and in any case
    the wstrb/tstrb is continuous)
    """
    addr : int
    data : bytearray
    stream_tlast_end : bool
    dformat : DataFormat
    is_linked_to_previous : bool = False

    def alignment_check(self):
        """
        Performing an alignment verification on the Data
        These do not depend on the parsing method
        But they are only done when the Data is used in an AXI or AXI-Lite master
        (not for axi-stream, if tdest is over the size of tdest in the bus, it'll throw an error anyways)
        """
        logger.info("Performing alignment checks on Data")
        logger.debug("\n" + str(self))

        if self.addr % self.dformat.word_size != 0:
            raise ValueError("Address (0x{0:X}) needs to be aligned on word size ({1})" \
                    .format(self.addr, self.dformat.word_size))
        
        logger.info("passed")

    def __str__(self):
        return self.to_raw()

    def is_word(self):
        """
        Returns True is the data can be represented as a single word
        """
        return len(self.data) <= self.dformat.word_size

    def to_words(self):
        """
        Returns self.data (an array of bytes) as a list of strings representing hexadecimal numbers of word_size bytes
        """
        hex_data = []

        x = 0
        while x < len(self.data):
            end_x = min(x+self.dformat.word_size, len(self.data))
            hex_data.append(
                utils.int_to_hex_string(int(self.data[x:end_x].hex(), 16), self.dformat.word_size)
            )
            x = end_x
        return hex_data

    def to_raw(self, addr_to_zero = False):
        """
        Returns the representation of 'self' as a sequence
        """
        logger.info("Writting Data to raw")

        if not self.dformat.is_supported():
            raise NotImplementedError("Unsupported format: \n{}".format(self.dformat))
        

        last_fields = []

        last_word_size = self.last_word_size()
        if last_word_size != self.dformat.word_size:
            last_fields.append(str(last_word_size))

        if self.stream_tlast_end:
            last_fields.append(self.dformat.tlast_char)


        data_file_addr = 0 if addr_to_zero else self.addr

        out = "@ {addr}; {length}; {encoding}; {word_size}; {endianness}; {packet_separator};\n{data}".format(
                addr = utils.int_to_hex_string(data_file_addr, self.dformat.addr_size),
                length = str(len(self.data)),
                encoding = "ascii" if self.dformat.encoding == Encoding.ASCII else "binary",
                word_size = str(self.dformat.word_size),
                endianness = "Big" if self.dformat.is_big_endian else "Little",
                packet_separator = self.dformat.tlast_char,
                data = "\n".join(self.to_words())
        )

        if len(last_fields) > 0:
            out += "; " +  "; ".join(last_fields)

        logger.info("Data written to raw")
        logger.debug("\n" + out)

        return out + '\n'



    @classmethod
    def from_raw(cls, raw, base_addr, fill_strategy):
        """
        Reads a sequence with a descriptor and returns a list of Data.
        At every end of packet ('!'), we create a new Data object that is put into the 'out' list.
        At the end of the sequence, a new Data object is created whether or not there is an end of packet.

        Once the whole sequence has been read, we either cut it or expand it depending on the 'size' parameter.
        """
        logger.info("Building Data from raw (base_addr = 0x{0:X}, fill_strategy = {1})".format(base_addr, fill_strategy))
        logger.debug("\n" + str(raw))

        fields = raw.split('\n')
        fields = list(filter(None, fields))

        descriptor_fields = fields[0].split(';')
        descriptor_fields = [f.strip() for f in descriptor_fields]

        # descriptor parsing
        base_addr = int(descriptor_fields[0], 0) + base_addr

        input_length = int(descriptor_fields[1], 0)
                
        dformat = DataFormat()
        dformat.encoding = Encoding.ASCII if descriptor_fields[2] == "ascii" else Encoding.BINARY
        dformat.word_size = int(descriptor_fields[3])

        if descriptor_fields[4] not in ["Big", "Little"]:
            raise ValueError("Wrong endianness: {} should be either Big or Little".format(descriptor_fields[4]))
        dformat.is_big_endian = descriptor_fields[4] == "Big"
        dformat.tlast_char = descriptor_fields[5]

        if not dformat.is_supported():
            raise NotImplementedError("Data format not supported:\n{}".format(dformat))

        # data parsing
        out = []
        data_fields = fields[1:]

        current_length = 0
        data = bytearray()
        stream_tlast_end = False
        for x in range(len(data_fields)):
            dfields = data_fields[x].split(';')
            dfields = [d.strip() for d in dfields]
            
            # Handling optional fields 1&2 (last word size and end of packet descriptor)
            i = 1
            word_size = dformat.word_size
            if i < len(dfields):
                ex = None
                try:
                    word_size = int(dfields[i])
                except ValueError as e:
                    ex = e
                finally:
                    if not ex:
                        if word_size > dformat.word_size:
                            raise ValueError("The last word size ({}) cannot be superior to the base word size ({})" \
                                    .format(word_size, dformat.word_size))
                        i += 1
                        if x != len(data_fields)-1:
                            raise NotImplementedError("A smaller size can only be defined for the last data word")


                if i < len(dfields):
                    if dfields[i] != dformat.tlast_char:
                        raise ValueError("End of packet descriptor isn't {} but {}" \
                                .format(dformat.tlast_char, dfields[i]))
                    stream_tlast_end = True
                    i += 1

                if i < len(dfields):
                    raise ValueError("Too many fields on this data line (max is 3: data; last_word_size;"
                                     "end_descriptor but current is {})".format(len(dfields)))


            # Handling the actual data (field 0)
            word = int(dfields[0], 0)
            if word.bit_length() > 8*word_size:
                logger.warning(
                        "Data word 0x{word:X} is {word_size} bits long which is higher than the word size"
                        "in the descriptor ({descriptor_word_size} bits)" \
                        .format(word = word, word_size = word.bit_length(), descriptor_word_size = 8*word_size)
                )
                word &= (2**(8*word_size) - 1)

            data += word.to_bytes(word_size, 'big' if dformat.is_big_endian else 'little')


            # Cutting the sequence in multiple Data if we have an end of packet in the middle of it
            # Also handle the last data (even if it doesn't end with an end of packet)
            if stream_tlast_end or x == len(data_fields)-1:
                out.append(Data(base_addr + current_length, data, stream_tlast_end, dformat))
            
                # Reset vars for new data
                current_length += len(data)
                data = bytearray()
                stream_tlast_end = False
        

        # Expansion or Cutting of the data

        # In case it's just a descriptor with no data defined
        if len(out) == 0:
            if input_length == 0:
                raise ValueError("An empty descriptor of size 0 isn't valid (because it wouldn't do anything)")
            out.append(Data(base_addr, data, stream_tlast_end, dformat))

        # Handling input_length vs current_length (cutting or filling data) 
        if current_length > input_length:
            logger.warning(
                    "Described data length ({}) is higher than the length specified in the descriptor ({})" \
                            .format(current_length, input_length)
            )

            while len(out) > 0 and current_length - len(out[-1].data) >= input_length:
                current_length -= len(out[-1].data)
                out.pop()
            if current_length > input_length:
                del out[-1].data[-(current_length-input_length):]
        else:
            FillStrategy.exec_on(fill_strategy, out[-1].data, input_length-current_length)
        

        for i in range(1, len(out)):
            out[i].is_linked_to_previous = True

        logger.info("Data built from raw")

        return out


    def represents_same_data_as(self, other, addr_offset = 0):
        """
        Almost like the == operator but checking only what's meaningfull
        """
        return self.data == other.data and self.addr == other.addr+addr_offset


    def first_word_padding(self):
        return self.addr%self.dformat.word_size

    def last_word_size(self):
        val = len(self.data) % self.dformat.word_size
        return val if val != 0 else self.dformat.word_size

    def first_word_size(self):
        return self.dformat.word_size - self.first_word_padding()

    def last_word_padding(self):
        return self.dformat.word_size - self.last_word_size()


    def write_to_memory(self, mem_component):
        mem_component.write(self.addr, self.data)

    @classmethod
    def from_memory(cls, mem_component, address, length):
        return cls(
            address,
            mem_component.read(address, length),
            True,
            DataFormat()
        )




def data_default_generator(min_addr, max_addr, size_range, word_size_range = [4], word_aligned = True):
    """
    Default random data generator
    Provided as an example but it fits many usecases
    """
    size = random.choice(size_range)
    word_size = random.choice(word_size_range)
    addr = random.choice(range(min_addr, max_addr-size))
    if word_aligned:
        addr = addr - (addr % word_size)
    data = bytearray(random.sample(range(2**8), size))

    return Data(addr, data, False, DataFormat(word_size))


