from enum import Enum
import random
import copy
from dataclasses import dataclass

from . import utils
from .fill_strategy import FillStrategy


class Encoding(Enum):
    ASCII = 0
    BINARY = 1


@dataclass
class DataFormat:
    word_size : int = 4
    is_big_endian : bool = True
    encoding : Encoding = Encoding.ASCII
    tlast_char : str = '!'
    addr_size : int = 4

    def is_supported(self):
        return self.is_big_endian == True and self.encoding == Encoding.ASCII and self.tlast_char == '!'


@dataclass(init=False)
class Data:
    addr : int
    data : bytearray
    stream_tlast_end : bool
    dformat : DataFormat

    def __init__(self, addr, data, stream_tlast_end, data_format):
        self.addr = addr
        self.data = data
        self.stream_tlast_end = stream_tlast_end
        self.dformat = data_format

        self.build_checks()

    def build_checks(self):
        """
        Performing generic checks on the Data
        These do not depend on the parsing method
        """
        if self.addr.bit_length() > 64:
            raise ValueError("Address 0x{0:X} cannot be represented with only 64 bits".format(addr))
        end_addr = self.addr + len(self.data) 
        if end_addr.bit_length() > 64:
            raise ValueError("Transfer end address (0x{0:X} + {1}) cannot be represented with only 64 bits" \
                             .format(self.addr, len(self.data)))
        if self.addr % self.dformat.word_size != 0:
            raise ValueError("Address (0x{0:X}) needs to be aligned on word size ({1})" \
                    .format(self.addr, self.dformat.word_size))

    def __str__(self):
        return self.to_raw()

    def is_word(self):
        return len(self.data) <= self.dformat.word_size

    def to_words(self):
        """
        Converts data (array of bytes) to a list of strings representing hexadecimal numbers of word_size bytes
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

        return out + "\n"




    @classmethod
    def from_raw(cls, raw, base_addr, fill_strategy):
        """
        TODO: catch exceptions & give proper error messages
        """
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


            word = int(dfields[0], 0)
            if word.bit_length() > 8*word_size:
                # TODO: log warning
                word &= (2**(8*word_size) - 1)
            data += word.to_bytes(word_size, 'big' if dformat.is_big_endian else 'little')

            if stream_tlast_end or x == len(data_fields)-1:
                out.append(Data(base_addr + current_length, data, stream_tlast_end, dformat))
            
                # Reset vars for new data
                current_length += len(data)
                data = bytearray()
                stream_tlast_end = False
        

        # In case it's just a descriptor with no data defined
        if len(out) == 0:
            if input_length == 0:
                raise ValueError("An empty descriptor of size 0 isn't valid (because it wouldn't do anything)")
            out.append(Data(base_addr, data, stream_tlast_end, dformat))

        # Handling input_length vs current_length (cutting or filling data) 
        if current_length > input_length:
            # TODO: log a warning
            while len(out) > 0 and current_length - len(out[-1].data) >= input_length:
                current_length -= len(out[-1].data)
                out.pop()
            if current_length > input_length:
                del out[-1].data[-(current_length-input_length):]
        else:
            FillStrategy.exec_on(fill_strategy, out[-1].data, input_length-current_length)

        return out


    def represents_same_data_as(self, other, addr_offset = 0):
        return self.data == other.data and self.addr == other.addr+addr_offset


    def first_word_padding(self):
        return self.addr%self.dformat.word_size

    def last_word_size(self):
        """
        ???????
        """
        val = len(self.data) % self.dformat.word_size
        return val if val != 0 else self.dformat.word_size

    def first_word_size(self):
        return self.dformat.word_size - self.first_word_padding()

    def last_word_padding(self):
        return self.dformat.word_size - self.last_word_size()


def data_default_generator(min_addr, max_addr, size_range, word_size_range = [4], word_aligned = True):
    size = random.choice(size_range)
    word_size = random.choice(word_size_range)
    addr = random.choice(range(min_addr, max_addr-size))
    if word_aligned:
        addr = addr - (addr % word_size)
    data = utils.int_list_to_bytearray(random.sample(range(2**8), size), True)

    return Data(addr, data, False, DataFormat(word_size))


