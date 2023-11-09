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


async def run_reads(master, data_list, dirpath):
    for i in range(len(data_list)):
        await master.read_data_to_file(
                os.path.join(dirpath, "{}.dat".format(i)),
                data_list[i].addr,
                len(data_list[i].data)
        )


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
            size_range = range(1, 0x10),
            word_size_range = range(1, 9),
            word_aligned = True
    )

    datalist_gen = partial(
            datalist_default_generator,
            data_gen,
            [2]
    )


    # Loading & executing scenarios
    tasks = []
    for i in range(2):
        # We generate datalist even though we only use the address and length generated because we already have
        # everything to log data & the generation takes into account that addr + length < max_addr
        data_list = datalist_gen()
        data_filepath = "generated_inputs/{}.dat".format(i)
        data_list.to_file(data_filepath)
        tasks.append(
                cocotb.start_soon(
                    run_reads(tb.masters_in[i], data_list, "read_data/{}/".format(i))
                )
        )

    # Letting the scenarios execute (passing simulation time)
    await Combine(*tasks)

    tb.write_monitor_data()

    compare_to_golden("stimlogs")
    compare_to_golden("read_data")

    print("file_write test passed")




