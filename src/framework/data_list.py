from .data import Data

class DataList(list):

    def __init__(self, base=[]):
        super().__init__(base)

    def __str__(self):
        out = "[\n"
        for d in self:
            out += str(d)
        return out + "]"


    @classmethod
    def from_file(cls, filename, base_addr, fill_strategy):
        f = open(filename)
        data = f.read()
        f.close()

        data = data.split('@')
        if data[0] == '' or data[0].isspace():
            data = data[1:]

        data_list = cls()
        for d in data:
            data_list += Data.from_raw(d, base_addr, fill_strategy)

        return data_list


    def to_file(self, file_path):
        f = open(file_path, "w")
        for d in self:
            f.write(d.to_raw())
        f.close()

    def represents_same_data_as(self, other, addr_offset = 0):
        for i in range(len(self)):
            if not self[i].represents_same_data_as(other[i], addr_offset):
                return False
        return True

    def __eq__(self, other):
        """
        No addr offset here
        """
        return self.represents_same_data_as(other)
