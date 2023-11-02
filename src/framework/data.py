from enum import Enum
import random
import copy
from dataclasses import dataclass

from . import utils

class Encoding(Enum):
    ASCII = 0
    BINARY = 1


@dataclass
class DataFormat:
    word_size : int = 4
    is_big_endian : bool = True
    encoding : Encoding = Encoding.ASCII
    tlast_char : str = '!'

    def is_supported(self):
        return self.is_big_endian == True and self.encoding == Encoding.ASCII and self.tlast_char == '!'


@dataclass(init=False)
class Data:
    addr : int
    data : bytearray
    stream_tlast_end : bool
    dformat : DataFormat

    def __init__(self, addr=0, data=None, stream_tlast_end = False, data_format = None):
        self.addr = addr
        self.data = data
        if not self.data:
            self.data = bytearray()
        self.stream_tlast_end = stream_tlast_end
        self.dformat = data_format
        if not self.dformat:
            self.dformat = DataFormat()

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
                "0x{data:0{word_size}X}".format(data=int(self.data[x:end_x].hex(), 16), word_size=self.dformat.word_size*2)
            )
            x = end_x
        return hex_data


        return 

    def to_raw(self):
        if not self.dformat.is_supported():
            raise NotImplementedError("Unsupported format: \n{}".format(self.dformat))
        

        last_fields = []

        last_word_size = self.last_word_size()
        if last_word_size != self.dformat.word_size:
            last_fields.append(str(last_word_size))

        if self.stream_tlast_end:
            last_fields.append(self.dformat.tlast_char)


        out = "@ {addr}; {length}; {encoding}; {word_size}; {endianness}; {packet_separator};\n{data}".format(
                addr = "0x{data:X}".format(data=self.addr),
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

        base_data = cls()
        
        # descriptor parsing
        base_data.addr = int(descriptor_fields[0], 0) + base_addr
        input_length = int(descriptor_fields[1], 0)
        base_data.dformat.encoding = Encoding.ASCII if descriptor_fields[2] == "ascii" else Encoding.BINARY
        base_data.dformat.word_size = int(descriptor_fields[3])
        if descriptor_fields[4] not in ["Big", "Little"]:
            raise ValueError("Wrong endianness: {} should be either Big or Little".format(descriptor_fields[4]))
        base_data.dformat.is_big_endian = descriptor_fields[4] == "Big"
        base_data.dformat.tlast_char = descriptor_fields[5]

        if not base_data.dformat.is_supported():
            raise NotImplementedError("Data format not supported:\n{}".format(d.format))

        # data parsing
        out = []
        data_fields = fields[1:]
        current_length = 0
        current_data = copy.deepcopy(base_data)
        for x in range(len(data_fields)):
            df = data_fields[x].split(';')
            df = [d.strip() for d in df]
            
            # Handling optional fields 1&2 (last word size and end of packet descriptor)
            i = 1
            word_size = current_data.dformat.word_size
            if i < len(df):
                try:
                    word_size = int(df[i])
                    if word_size > current_data.dformat.word_size:
                        raise ValueError("The last word size ({}) cannot be superior to the base word size({})" \
                                .format(word_size, current_data.dformat.word_size))
                    i += 1
                    if x != len(data_fields)-1:
                        raise NotImplementedError("A smaller size can only be defined for the last data word")
                except ValueError:
                    pass

                if i < len(df):
                    if df[i] != current_data.dformat.tlast_char:
                        raise ValueError("End of packet descriptor isn't {} but {}".format(current_data.dformat.tlast_char, df[i]))
                    current_data.stream_tlast_end = True
                    i += 1

                if i < len(df):
                    raise ValueError("Too many fields on this data line (max is 3: data; last_word_size;"
                                     "end_descriptor but current is {})".format(len(df)))


            word = int(df[0], 0) & (2**(8*word_size) - 1)
            current_data.data += word.to_bytes(word_size, 'big' if current_data.dformat.is_big_endian else 'little')

            if current_data.stream_tlast_end or x == len(data_fields)-1:
                out.append(current_data)
            
                # If it's not the last data then all the bytes were described
                # We handle the last data filling below
                current_length += len(current_data.data)
        
                current_data = copy.deepcopy(base_data)
                current_data.addr = base_data.addr + current_length
        

        # In case it's just a descriptor with no data defined
        if len(out) == 0:
            if input_length == 0:
                raise ValueError("An empty descriptor of size 0 isn't valid (because it wouldn't do anything)")
            out.append(base_data)

        # Handling input_length vs current_length (cutting or filling data) 
        if current_length > input_length:
            while len(out) > 0 and current_length - len(out[-1].data) >= input_length:
                current_length -= len(out[-1].data)
                out.pop()
            if current_length > input_length:
                del out[-1].data[-(current_length-input_length):]
        else:
            fill_strategy.exec_on(out[-1].data, input_length-current_length)

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


def data_default_generator(min_addr, max_addr, size_range, word_size_range = [4]):
    out = Data()

    out.size = random.choice(size_range)
    out.addr = random.choice(range(min_addr, max_addr-out.size))
    out.dformat.word_size = random.choice(word_size_range)
    out.data = utils.int_list_to_bytearray(random.sample(range(2**8), out.size), True)

    return out


