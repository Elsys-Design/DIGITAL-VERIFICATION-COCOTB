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
from framework.stimuli import stimuli_default_generator
from framework.stimuli_list import stimulilist_default_generator
from framework.time import Time

from test_utils.filecmp import compare_to_golden

from tb import TB



@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    # Building Data generator
    data_gen = partial(
            data_default_generator,
            min_addr = 0x44A20000,
            max_addr = 0x44A4FFFF,
            size_range = range(1, 0x20),
            word_size_range = [2**i for i in range(4)]
    )

    # Building DataList generator using the Data generator
    datalist_gen = partial(
            datalist_default_generator,
            data_gen,
            [1]
    )

    stimuli_gen = partial(
            stimuli_default_generator,
            datalist_gen,
            delay_range = range(0, Time(100, 'ns').value)
    )

    stimulilist_gen = partial(
            stimulilist_default_generator,
            stimuli_gen,
            size_range = [4]
    )



    # Loading scenarios
    tasks = []
    for i in range(2):
        # StimuliList random generation
        stim_list = stimulilist_gen()
        stim_dirpath = "generated_inputs/{}".format(i)
        # Writting the generated DataList to a file
        stim_list.write_to_dir(stim_dirpath)

        # Saving the new thread handle for each master
        tasks.append(
                # Creating a new thread for each master
                cocotb.start_soon(
                    # Function to execute in the thread
                    stim_list.run(tb.masters_in[i])
                )
        )

    # Letting the scenarios execute (passing simulation time)
    await Combine(*tasks)

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitor_data()

    # Comparing stimlogs/ and golden_stimlogs/seed/
    compare_to_golden("stimlogs")

    print("random_stimulis test passed")




