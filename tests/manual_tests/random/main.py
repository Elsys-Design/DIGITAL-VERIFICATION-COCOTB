from functools import partial
from framework.data import *
from framework.data_list import *
from framework.stimuli import *
from framework.stimuli_list import *
from framework.time import Time



data_gen = partial(
        data_default_generator,
        min_addr = 0x0,
        max_addr = 0x44A2FFFF,
        size_range = [1, 4, 8],
        word_size_range = [4]
)

datalist_gen = partial(
        datalist_default_generator,
        data_gen,
        [1]
)


stimuli_gen = partial(
        stimuli_default_generator,
        datalist_gen,
        range(0, Time(10, "ns").value)
)

stimulilist_gen = partial(
        stimulilist_default_generator,
        stimuli_gen,
        range(1, 17)
)


stimlist = stimulilist_gen()

stimlist.write_to_dir("generated")
