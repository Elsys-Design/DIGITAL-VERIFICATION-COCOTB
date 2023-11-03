from enum import IntEnum
import random


class FillStrategy(IntEnum):
    RANDOM = -1
    ZEROS = 0
    ONES = 1

    def exec_on(self, barray, len_toadd):
        assert len_toadd >= 0, "len_toadd must be >= 0"

        if self == self.RANDOM:
            barray += bytearray(random.sample(range(0, 0xff), len_toadd))
        else:
            barray += bytearray([self*0xff] * len_toadd)


