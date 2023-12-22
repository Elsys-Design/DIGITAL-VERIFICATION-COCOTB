import random
import os
import logging
from typing import List, Sequence, Optional, Callable

from .fill_strategy import FillStrategy
from .data import Data


class DataList(list):
    """
    This class represents a whole Data file.
    It's a list but has some more functionnalities.

    Attributes:
        logger: DataList class logger (class attribute).
    """

    # Class attribute, never changes
    logger = logging.getLogger("framework.data_list")

    def __init__(self, base: List[Data] = []) -> None:
        """ """
        super().__init__(base)

    @classmethod
    def from_file(
        cls,
        filename: str,
        base_addr: int = 0,
        fill_strategy: FillStrategy = FillStrategy.ZEROS,
        is_stream: bool = False,
    ) -> None:
        """
        Creates a data list from a data text file.
        Raises an error if there is no sequence in that file.

        Args:
            base_addr: Address that is added to the address parsed in the descriptor of each data to form their
                complete address.
            fill_strategy: FillStrategy to use to complete the data if the parsed data is smaller than the length in the
                descriptor.
            is_stream: If True, the Data is parsed as an AXI-Stream data. This means that the address field is
                considered to be a tdest that doesn't increment.

        Returns:
            The parsed DataList object.

        Raises:
            ValueError: Parsing error.
        """
        cls.logger.debug(
            "Building DataList from {0}: base_addr = {1:X}, fill_strategy = {2}".format(
                filename, base_addr, fill_strategy
            )
        )

        f = open(filename)
        data = f.read()
        f.close()

        data = data.split("@")
        if data[0] == "" or data[0].isspace():
            data = data[1:]

        if len(data) == 0:
            raise ValueError(
                "File {} doesn't contain any valid data description".format(filename)
            )

        data_list = cls()
        for d in data:
            data_list += Data.from_raw(d, base_addr, fill_strategy, is_stream)

        if not is_stream:
            for d in data_list:
                d.alignment_check()

        cls.logger.debug("DataList built")

        return data_list

    def __str__(self) -> str:
        """
        Returns:
            The string representation in Data format.
        """
        return self.to_str()

    def to_str(self, addr_to_zero=False) -> str:
        """
        Returns:
            The string representation in Data format.
        """
        string_list = []
        for d in self:
            string_list.append(d.to_raw(addr_to_zero))

        return "\n".join(string_list) + "\n"

    def to_file(self, filepath: str, addr_to_zero: bool = False) -> None:
        """
        Writes a whole data list to a file.

        Args:
            filepath: Path to the output file relative to the current directory (= os.getcwd()).
                If the directories specified in the path do not exist, they'll be created.
            addr_to_zero: If True, the address in the descriptor of each data sequence will be fixed to zero.
        """
        self.logger.debug(
            "Writting DataList to {}: addr_to_zero = {}".format(filepath, addr_to_zero)
        )

        dirpath = os.path.dirname(filepath)
        if dirpath:
            os.makedirs(dirpath, exist_ok=True)

        f = open(filepath, "w")
        f.write(self.to_str(addr_to_zero))
        f.close()

        self.logger.debug("DataList written to {}".format(filepath))

    def full_bytearray(self) -> bytearray:
        """
        Returns:
            A bytearray representing all the data this object contains.
        """
        out = bytearray()
        for d in self:
            out += d.data
        return out

    def represents_same_data_as(self, other: "DataList", addr_offset: int = 0) -> bool:
        """
        Almost like the == operator but checking only what's meaningfull.

        Args:
            other: Other DataList object to compare to.
            addr_offset: Address offset of the other compared to self.

        Returns:
            True if the datas and addresses represented by self and other are the same, taking the address offset into
            account.
        """
        for i in range(len(self)):
            if not self[i].represents_same_data_as(other[i], addr_offset):
                return False
        return True


def datalist_default_generator(
    data_generator: Callable,
    size_range: Sequence[int],
    fill_data: Optional[bool] = None,
) -> DataList:
    """
    Random data list generator.

    Args:
        data_generator: Data generator function.
        size_range: Sequence of possible data lengths.
        fill_data: Propagated to the data_generator if it's not None.
            If fill_data is None, the data_generator must specify a default fill_data argument
            (the data_default_generator does that already).

    Returns:
        A randomly generated DataList object.
    """
    size = random.choice(size_range)
    out = DataList()
    data_gen_arg = {} if fill_data is None else {"fill_data": fill_data}
    for i in range(size):
        out.append(data_generator(**data_gen_arg))
    return out
