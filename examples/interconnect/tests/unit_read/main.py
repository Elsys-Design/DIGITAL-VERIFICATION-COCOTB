import os
import random
from functools import partial
import filecmp

import cocotb
from cocotb.triggers import Combine, Timer
from cocotb.result import TestFailure

from framework.stimuli_list import StimuliList
from framework.data import Data, data_default_generator
from framework.data_list import DataList, datalist_default_generator

from test_utils.filecmp import compare_to_golden

from tb import TB



@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    tb.fill_memories()

    data_gen = partial(
            data_default_generator,
            min_addr = 0x44A00000,
            max_addr = 0x44A4FFFF,
            size_range = [1, 4, 8],
            word_size_range = range(1, 9),
            word_aligned = True
    )

    datalist_gen = partial(
            datalist_default_generator,
            data_gen,
            [1]
    )


    # Loading & executing scenarios
    tasks = []
    for i in range(2):
        data_list = datalist_gen()
        data_list.to_file("generated_inputs/{}.dat".format(i))
        tasks.append(
                cocotb.start_soon(
                    data_list.read_using(tb.masters_in[i])
                )
        )

    # Letting the scenarios execute (passing simulation time)
    await Combine(*tasks)


    tb.write_monitor_data()

    compare_to_golden("stimlogs")


    print("unit_read test passed")




