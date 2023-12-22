from enum import Enum
import random
from dataclasses import dataclass
import logging
from typing import List, Union, Sequence, Optional

from . import utils
from .fill_strategy import FillStrategy


class Encoding(Enum):
    """
    Encoding enumeration (see Encoding field in sequences descriptors in Data files).
    """

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

    word_size: int = 4
    is_big_endian: bool = True
    encoding: Encoding = Encoding.ASCII
    tlast_char: str = "!"
    addr_size: int = 4

    def is_supported(self) -> bool:
        """
        Returns:
            True if the DataFormat is currently supported.

        This method should be updated as functionalities are added.
        """
        return (
            self.is_big_endian
            and self.encoding == Encoding.ASCII
            and self.tlast_char == "!"
        )


@dataclass(init=False)
class Data:
    """
    Represents either:
    - an AXI Burst
    - multiple consecutive AXI-Lite transfers
    - multiple AXI-Stream 'transfers' with an optional tlast during the last transfer

    In any case, the transfer is continuous (for AXI/AXI-Lite, the addresses increment by the word size and in any case
    the wstrb/tstrb is continuous)

    Data objects can be built unallocated (Data.build_empty) and allocated later by setting the data property or by
    called allocate_data.
    Building unallocated Data objects allows to specify Read transactions without allocating a possibly large data
    bytearray. This data bytearray is allocated only when the Read transaction is executed and actual data has to be
    stored.

    Attributes:
        addr: Start address of the transaction.
        ends_with_tlast: True if this Data object ends with a end of packet descriptor.
        dformat: Printing format for this Data object.

        is_allocated: Read-only property that is True if the data attribute is allocated (it's a bytearray).
        length: Property returning the length of the Data. It can only be set if the Data isn't allocated.
        data: Property returning the transaction data (bytearray). It can only be accessed when the Data is allocated,
            setting it automatically allocates the Data.

        logger: Data class logger (class attribute).
    """

    addr: int
    ends_with_tlast: bool
    dformat: DataFormat

    # Class attribute, never changes
    logger = logging.getLogger("framework.data")

    # Private attribute
    _data_or_length: Union[bytearray, int]

    def __init__(
        self,
        addr: int,
        data: Union[bytearray, int],
        ends_with_tlast: bool = True,
        dformat: Optional[DataFormat] = None,
    ) -> None:
        """
        Args:
            data: Can either be a bytearray or an int.
                If it's an int, it's considered to be a word.
        """
        self.addr = addr
        self.ends_with_tlast = ends_with_tlast
        self.dformat = dformat

        self._data_or_length = None
        if isinstance(data, int):
            self._data_or_length = bytearray(
                data.to_bytes((data.bit_length() + 7) // 8, byteorder="big")
            )
            if self.dformat is None:
                self.dformat = DataFormat(len(self.data))
        else:  # data is a bytearray
            self._data_or_length = data
            if self.dformat is None:
                self.dformat = DataFormat()

        if self.addr.bit_length() > 64:
            raise ValueError(
                "Data address cannot be written on 64 bits: 0x{0:X}".format(self.addr)
            )

    @classmethod
    def build_empty(
        cls,
        addr: int,
        length: int,
        ends_with_tlast: bool = True,
        dformat: Optional[DataFormat] = None,
    ) -> "Data":
        """
        Args:
            length: The length of the Data to build.

        Returns:
            A new Data object that isn't allocated with the specified length.
        """
        out = cls(addr, None, ends_with_tlast, dformat)
        # when data is an int, it specifies a length (see length or is_allocated properties)
        out._data_or_length = length
        return out

    @property
    def is_allocated(self) -> bool:
        """
        Returns:
            True if the Data is allocated (= not empty).
        """
        return not isinstance(self._data_or_length, int)

    @property
    def length(self) -> int:
        """
        Works regardless of whether the Data is allocated or not.

        Returns:
            The length of the data.
        """
        return len(self._data_or_length) if self.is_allocated else self._data_or_length

    @length.setter
    def length(self, value: int) -> None:
        """
        Only for unallocated Data objects.

        Args:
            value: The new length of self.data.

        Raises:
            RuntimeError: This method shouldn't be used on allocated Data objects
        """
        if self.is_allocated:
            raise RuntimeError(
                "Cannot set the length of an allocated Data, change Data.data attribute directly"
            )
        self._data_or_length = value

    @property
    def data(self) -> bytearray:
        """
        Only for allocated objects.

        Returns:
            The data bytearray.
        """
        if not self.is_allocated:
            raise RuntimeError("Tried to get Data.data on an allocated Data object")
        return self._data_or_length

    @data.setter
    def data(self, data: bytearray) -> None:
        """
        This setter allocates the Data if it wasn't allocated before.

        Args:
            data: The new data bytearray.
        """
        self._data_or_length = data

    def alignment_check(self) -> None:
        """
        Performing an alignment verification on the Data.
        These do not depend on the parsing method but they are only done when the Data is used in an AXI(-Lite) master
        (not for axi-stream, if tdest is over the size of tdest in the bus, it'll throw an error anyways).

        Raises:
            ValueError: The address isn't aligned on the word size.
        """
        self.logger.debug("Performing alignment checks on Data")

        if self.addr % self.dformat.word_size != 0:
            raise ValueError(
                "Address (0x{0:X}) needs to be aligned on word size ({1})".format(
                    self.addr, self.dformat.word_size
                )
            )

    def __str__(self) -> str:
        """
        Returns:
            The string representation in Data format.
        """
        return self.to_raw()

    def is_word(self) -> bool:
        """
        Returns:
            True is the data can be represented as a single word.
        """
        return self.length <= self.dformat.word_size

    def to_words(self) -> List[str]:
        """
        Returns:
            self.data as a list of strings representing hexadecimal numbers of self.dformat.word_size bytes.
        """
        hex_data = []

        x = 0
        while x < self.length:
            end_x = min(x + self.dformat.word_size, self.length)
            hex_data.append(
                utils.int_to_hex_string(
                    int(self.data[x:end_x].hex(), 16), self.dformat.word_size
                )
            )
            x = end_x
        return hex_data

    def to_raw(self, addr_to_zero: bool = False) -> str:
        """
        Args:
            addr_to_zero: If True, the address in the descriptor will be fixed to zero.
        Returns:
            The string representation in Data format.
        Raises:
            NotImplementedError: When trying to parse an unsupported format (see DataFormat.is_supported).
        """
        self.logger.debug("Writting Data to raw")

        if not self.dformat.is_supported():
            raise NotImplementedError("Unsupported format: \n{}".format(self.dformat))

        last_fields = []

        data_file_addr = 0 if addr_to_zero else self.addr

        out = "@ {addr}; {length}; {encoding}; {word_size}; {endianness}; {packet_separator};".format(
            addr=utils.int_to_hex_string(data_file_addr, self.dformat.addr_size),
            length=str(self.length),
            encoding="ascii" if self.dformat.encoding == Encoding.ASCII else "binary",
            word_size=str(self.dformat.word_size),
            endianness="Big" if self.dformat.is_big_endian else "Little",
            packet_separator=self.dformat.tlast_char,
        )

        if self.is_allocated:
            out += "\n" + "\n".join(self.to_words())

            last_word_size = self.last_word_size()
            if last_word_size != self.dformat.word_size:
                last_fields.append(str(last_word_size))

            if self.ends_with_tlast:
                last_fields.append(self.dformat.tlast_char)

            if len(last_fields) > 0:
                out += "; " + "; ".join(last_fields)

        self.logger.debug("Data written to raw")

        return out + "\n"

    @classmethod
    def from_raw(
        cls,
        raw: str,
        base_addr: int,
        fill_strategy: FillStrategy,
        is_stream: bool = False,
    ) -> List["Data"]:
        """
        Reads a sequence with a descriptor and returns a list of Data.
        At every end of packet ('!'), we create a new Data object that is put into the 'out' list.
        At the end of the sequence, a new Data object is created whether or not there is an end of packet.

        Once the whole sequence has been read, we either cut it or expand it depending on the 'size' parameter.

        Args:
            raw: Raw string in the Data (parsing) format.
            base_addr: Address that is added to the address parsed in the raw argument to form the complete address.
            fill_strategy: FillStrategy to use to complete the data if the parsed data is smaller than the length in the
                descriptor.
            is_stream: If True, the Data is parsed as an AXI-Stream data. This means that the address field is
                considered to be a tdest that doesn't increment. This is important for the parsing of Sequences that
                contain end of packet descriptors since they are parsed as multiple Data objects, each with a start
                address (that increments in AXI(-Lite) but not in AXI-Stream).

        Returns:
            The parsed Data objects in a list.

        Raises:
            ValueError: Parsing error.
            NotImplementedError: Parsing error.
        """
        cls.logger.debug(
            "Building Data from raw (base_addr = 0x{0:X}, fill_strategy = {1})".format(
                base_addr, fill_strategy
            )
        )

        fields = raw.split("\n")
        fields = list(filter(None, fields))

        descriptor_fields = fields[0].split(";")
        descriptor_fields = [f.strip() for f in descriptor_fields]

        # descriptor parsing
        base_addr = int(descriptor_fields[0], 0) + base_addr

        input_length = int(descriptor_fields[1], 0)

        dformat = DataFormat()
        dformat.encoding = (
            Encoding.ASCII if descriptor_fields[2] == "ascii" else Encoding.BINARY
        )
        dformat.word_size = int(descriptor_fields[3])

        if descriptor_fields[4] not in ["Big", "Little"]:
            raise ValueError(
                "Wrong endianness: {} should be either Big or Little".format(
                    descriptor_fields[4]
                )
            )
        dformat.is_big_endian = descriptor_fields[4] == "Big"
        dformat.tlast_char = descriptor_fields[5]

        if not dformat.is_supported():
            raise NotImplementedError("Data format not supported:\n{}".format(dformat))

        # data parsing
        out = []
        data_fields = fields[1:]

        current_length = 0
        data = bytearray()
        ends_with_tlast = False
        for x in range(len(data_fields)):
            dfields = data_fields[x].split(";")
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
                            raise ValueError(
                                "The last word size ({}) cannot be superior to the base word size ({})".format(
                                    word_size, dformat.word_size
                                )
                            )
                        i += 1
                        if x != len(data_fields) - 1:
                            raise NotImplementedError(
                                "A smaller size can only be defined for the last data word"
                            )

                if i < len(dfields):
                    if dfields[i] != dformat.tlast_char:
                        raise ValueError(
                            "End of packet descriptor isn't {} but {}".format(
                                dformat.tlast_char, dfields[i]
                            )
                        )
                    ends_with_tlast = True
                    i += 1

                if i < len(dfields):
                    raise ValueError(
                        "Too many fields on this data line (max is 3: data; last_word_size;"
                        "end_descriptor but current is {})".format(len(dfields))
                    )

            # Handling the actual data (field 0)
            word = int(dfields[0], 0)
            if word.bit_length() > 8 * word_size:
                cls.logger.warning(
                    "Data word 0x{word:X} is {word_size} bits long which is higher than the word size"
                    "in the descriptor ({descriptor_word_size} bits)".format(
                        word=word,
                        word_size=word.bit_length(),
                        descriptor_word_size=8 * word_size,
                    )
                )
                word &= 2 ** (8 * word_size) - 1

            data += bytearray(
                word.to_bytes(word_size, "big" if dformat.is_big_endian else "little")
            )

            # Cutting the sequence in multiple Data if we have an end of packet in the middle of it
            # Also handle the last data (even if it doesn't end with an end of packet)
            if ends_with_tlast or x == len(data_fields) - 1:
                addr = base_addr if is_stream else base_addr + current_length
                out.append(Data(addr, data, ends_with_tlast, dformat))

                # Reset vars for new data
                current_length += len(data)
                data = bytearray()
                ends_with_tlast = False

        # Expansion or Cutting of the data

        # In case it's just a descriptor with no data defined
        if len(out) == 0:
            if input_length == 0:
                raise ValueError(
                    "An empty descriptor of size 0 isn't valid (because it wouldn't do anything)"
                )
            out.append(Data(base_addr, data, False, dformat))

        # Handling input_length vs current_length (cutting or filling data)
        # input_length == 0 -> we already have the right size
        if input_length != 0:
            if current_length > input_length:
                cls.logger.warning(
                    "Described data length ({}) is higher than the length specified in the descriptor ({})".format(
                        current_length, input_length
                    )
                )

                while (
                    len(out) > 0 and current_length - len(out[-1].data) >= input_length
                ):
                    current_length -= len(out[-1].data)
                    out.pop()
                if current_length > input_length:
                    del out[-1].data[-(current_length - input_length) :]
            else:
                FillStrategy.exec_on(
                    fill_strategy, out[-1].data, input_length - current_length
                )

        cls.logger.debug("Data built from raw")

        return out

    def represents_same_data_as(self, other: "Data", addr_offset: int = 0) -> bool:
        """
        Almost like the == operator but checking only what's meaningfull.

        Args:
            other: Other Data object to compare to.
            addr_offset: Address offset of the other compared to self.
                (returns True => self.addr == other.addr+addr_offset)

        Returns:
            True if the data and address represented by self and other are the same, taking the address offset into
            account.
        """
        return self.data == other.data and self.addr == other.addr + addr_offset

    def last_word_size(self) -> int:
        """
        Returns:
            The size of the last word.
        """
        val = self.length % self.dformat.word_size
        return val if val != 0 else self.dformat.word_size


def data_default_generator(
    min_addr: int,
    max_addr: int,
    size_range: Sequence[int],
    word_size_range: Sequence[int] = [4],
    word_aligned: bool = True,
    fill_data: bool = True,
) -> Data:
    """
    Default random data generator for AXI and AXI-Lite buses.
    Provided as an example but it fits many usecases.

    Args:
        min_addr: Smallest start address that can be generated.
        max_addr: Maximum end address that can be generated.
        size_range: Sequence of possible data lengths.
        word_size_range: Sequence of possible word_sizes.
        word_aligned: If True, the generated Data object will have an address aligned with its word_size.
        fill_data: If True, the data is randomly generated. If False, an empty Data object is created.

    Returns:
        A randomly generated Data object.
    """
    size = random.choice(size_range)
    word_size = random.choice(word_size_range)
    addr = random.choice(range(min_addr, max_addr - size))
    if word_aligned:
        addr = addr - (addr % word_size)

    data = Data.build_empty(addr, size, False, DataFormat(word_size))

    if fill_data:
        new_data = bytearray()
        FillStrategy.exec_on(FillStrategy.RANDOM, new_data, data.length)
        data.data = new_data

    return data


def stream_data_default_generator(
    tdest_range: Sequence[int],
    size_range: Sequence[int],
    word_size_range: Sequence[int] = [4],
    ends_with_tlast: bool = True,
    fill_data: bool = True,
) -> Data:
    """
    Default random data generator for AXI-Stream buses.
    Provided as an example but it fits many usecases.

    Args:
        tdest_range: Sequence of possible tdest values.
        size_range: Sequence of possible data lengths.
        word_size_range: Sequence of possible word_sizes.
        ends_with_tlast: If True, the generated Data will have an end of packet descriptor at the end.
            If False, it won't have one. If None, there is 1/2 chance it will (and 1/2 chance it won't).
        fill_data: If True, the data is randomly generated. If False, an empty Data object is created.

    Returns:
        A randomly generated Data object.
    """
    size = random.choice(size_range)
    word_size = random.choice(word_size_range)
    addr = random.choice(tdest_range)

    if ends_with_tlast is None:
        ends_with_tlast = bool(random.getrandbits(1))

    if fill_data:
        data = bytearray([random.randrange(0, 2**8) for _ in range(size)])
        return Data(addr, data, ends_with_tlast, DataFormat(word_size))
    else:
        return Data.build_empty(addr, size, ends_with_tlast, DataFormat(word_size))
