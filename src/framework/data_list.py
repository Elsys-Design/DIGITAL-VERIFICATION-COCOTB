import random
from .fill_strategy import FillStrategy
from .data import Data

class DataList(list):

    def __init__(self, base=[]):
        super().__init__(base)

    @classmethod
    def from_file(cls, filename, base_addr = 0, fill_strategy = FillStrategy.ZEROS):
        f = open(filename)
        data = f.read()
        f.close()

        data = data.split('@')
        if data[0] == '' or data[0].isspace():
            data = data[1:]

        if len(data) == 0:
            raise ValueError("File {} doesn't contain any valid data description")

        data_list = cls()
        for d in data:
            data_list += Data.from_raw(d, base_addr, fill_strategy)

        return data_list


    def __str__(self):
        return to_str()

    def to_str(self, addr_to_zero = False):
        string_list = []
        for d in self:
            string_list.append(d.to_raw(addr_to_zero))

        return "\n".join(string_list) + "\n"

    def to_file(self, file_path, addr_to_zero = False):
        f = open(file_path, "w")
        f.write(self.to_str(addr_to_zero))
        f.close()

    def represents_same_data_as(self, other, addr_offset = 0):
        for i in range(len(self)):
            if not self[i].represents_same_data_as(other[i], addr_offset):
                return False
        return True


def datalist_default_generator(data_generator, size_range):
    size = random.choice(size_range)
    out = DataList()
    for i in range(size):
        out.append(data_generator())
    return out

