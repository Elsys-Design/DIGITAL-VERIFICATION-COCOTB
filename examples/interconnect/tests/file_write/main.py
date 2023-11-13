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

    data_gen = partial(
            data_default_generator,
            min_addr = 0x44A00000,
            max_addr = 0x44A4FFFF,
            size_range = range(1, 0x20),
            word_size_range = [2**i for i in range(4)]
    )

    datalist_gen = partial(
            datalist_default_generator,
            data_gen,
            [10]
    )


    # Loading & executing scenarios
    tasks = []
    for i in range(2):
        data_list = datalist_gen()
        data_filepath = "generated_inputs/{}.dat".format(i)
        data_list.to_file(data_filepath)
        tasks.append(
                cocotb.start_soon(
                    tb.masters_in[i].write_data_from_file(data_filepath)
                )
        )

    # Letting the scenarios execute (passing simulation time)
    await Combine(*tasks)

    tb.write_monitor_data()

    compare_to_golden("stimlogs")

    print("file_write test passed")




