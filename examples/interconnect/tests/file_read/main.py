import os
import random
from functools import partial
import filecmp

import cocotb
from cocotb.triggers import Combine, Timer
from cocotb.result import TestFailure

from framework.stimuli_list import StimuliList
from framework.data import Data, empty_data_default_generator
from framework.data_list import DataList, datalist_default_generator

from test_utils.filecmp import compare_to_golden

from tb import TB


async def run_reads(master, data_list, dirpath):
    for i in range(len(data_list)):
        await master.read_data_to_file(
                os.path.join(dirpath, "{}.dat".format(i)),
                data_list[i]
        )


@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    # Filling the testbench's rams with random data
    tb.fill_memories()

    # Building Data generator
    # we use the empty_data_default_generator to generate only an address and length
    # and not the actual data since we're going to read
    data_gen = partial(
            empty_data_default_generator,
            min_addr = 0x44A00000,
            max_addr = 0x44A4FFFF,
            size_range = range(1, 0x20),
            word_size_range = [2**i for i in range(4)]
    )

    # Building DataList generator using the Data generator
    datalist_gen = partial(
            datalist_default_generator,
            data_gen,
            [10]
    )


    # Loading scenarios
    tasks = []
    for i in range(2):
        # DataList random generation
        data_list = datalist_gen()
        data_filepath = "generated_inputs/{}.dat".format(i)
        # Writting the generated DataList to a file
        data_list.to_file(data_filepath)

        # Saving the new thread handle for each master
        tasks.append(
                # Creating a new thread for each master
                cocotb.start_soon(
                    # Function to execute in the thread
                    run_reads(tb.masters_in[i], data_list, "read_data/{}/".format(i))
                )
        )

    # Letting the scenarios execute (passing simulation time)
    await Combine(*tasks)

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitor_data()

    # Comparing stimlogs/ and golden_stimlogs/seed/
    compare_to_golden("stimlogs")
    compare_to_golden("read_data")

    print("file_write test passed")




