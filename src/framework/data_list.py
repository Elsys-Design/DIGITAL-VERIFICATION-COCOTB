import random
import os
import logging

from .fill_strategy import FillStrategy
from .data import Data


class DataList(list):
    """
    This class represents a whole Data file.
    """
    logger = logging.getLogger("framework.data_list")

    def __init__(self, base=[]):
        super().__init__(base)

    @classmethod
    def from_file(cls, filename, base_addr = 0, fill_strategy = FillStrategy.ZEROS, is_stream = False):
        """
        Creates a data list from a data text file.
        Raises an error if there is no sequence in that file.
        """
        cls.logger.debug("Building DataList from {0}: base_addr = {1:X}, fill_strategy = {2}" \
                .format(filename, base_addr, fill_strategy))

        f = open(filename)
        data = f.read()
        f.close()

        data = data.split('@')
        if data[0] == '' or data[0].isspace():
            data = data[1:]

        if len(data) == 0:
            raise ValueError("File {} doesn't contain any valid data description".format(filename))

        data_list = cls()
        for d in data:
            data_list += Data.from_raw(d, base_addr, fill_strategy, is_stream)

        if not is_stream:
            for d in data_list:
                d.alignment_check()

        cls.logger.debug("DataList built")

        return data_list


    def __str__(self):
        return to_str()

    def to_str(self, addr_to_zero = False):
        """
        Returns a string describing the data list in the data format.
        addr_to_zero parameter allows to force the address to be printed as '0x00000000' (if addr_size == 4).
        """
        string_list = []
        for d in self:
            string_list.append(d.to_raw(addr_to_zero))

        return "\n".join(string_list) + "\n"

    def to_file(self, filepath, addr_to_zero = False):
        """
        Writes a whole data list to a file.
        """
        self.logger.debug("Writting DataList to {}: addr_to_zero = {}".format(filepath, addr_to_zero))

        dirpath = os.path.dirname(filepath)
        if dirpath:
            os.makedirs(dirpath, exist_ok=True)

        f = open(filepath, "w")
        f.write(self.to_str(addr_to_zero))
        f.close()
        
        self.logger.debug("DataList written to {}".format(filepath))

    def full_bytearray(self):
        out = bytearray()
        for d in self:
            out += d.data
        return out


    def represents_same_data_as(self, other, addr_offset = 0):
        """
        Almost like the == operator but checking only what's meaningfull
        """
        for i in range(len(self)):
            if not self[i].represents_same_data_as(other[i], addr_offset):
                return False
        return True


def datalist_default_generator(data_generator, size_range, fill_data = True):
    """
    Random data list generator
    """
    size = random.choice(size_range)
    out = DataList()
    for i in range(size):
        out.append(data_generator(fill_data = fill_data))
    return out

