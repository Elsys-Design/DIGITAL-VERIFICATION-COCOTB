import os
from functools import partial
import logging

from framework import data_default_generator, datalist_default_generator, DataList


tests_nb = 100
tmp_filepath = "tmp.dat"


data_gen = partial(
    data_default_generator,
    min_addr=0x0,
    max_addr=0x44A2FFFF,
    size_range=range(1, 0x100),
    word_size_range=range(1, 9),
    word_aligned=True,
)

datalist_gen = partial(datalist_default_generator, data_gen, range(1, 100))


def test_random():
    print("Starting random parsing & printing tests")
    print("Disabling logging to avoid overhead")
    logging.disable(logging.CRITICAL)

    for i in range(tests_nb):
        generated = datalist_gen()
        generated.to_file(tmp_filepath, addr_to_zero=False)
        parsed = DataList.from_file(tmp_filepath)

        for c in range(len(generated)):
            assert (
                generated[c] == parsed[c]
            ), "Failure:\n{}\n---------------\n{}\n".format(generated[c], parsed[c])

    os.remove(tmp_filepath)
    print("Random parsing & printing tests passed")


if __name__ == "__main__":
    test_random()
