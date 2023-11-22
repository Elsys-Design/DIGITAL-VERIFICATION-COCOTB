import os
import random
from functools import partial
import filecmp

import cocotb
from cocotb.triggers import Combine, Timer
from cocotb.result import TestFailure

import framework

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
            framework.data_default_generator,
            min_addr = 0x44A20000,
            max_addr = 0x44A4FFFF,
            size_range = range(1, 0x20),
            word_size_range = [2**i for i in range(4)]
    )

    # Building DataList generator using the Data generator
    datalist_gen = partial(
            framework.datalist_default_generator,
            data_gen,
            [1]
    )

    # Building Stimuli generator using the DataList generator
    stimuli_gen = partial(
            framework.stimuli_default_generator,
            datalist_gen,
            delay_range = range(0, framework.Time(100, 'ns').value)
    )

    # Building the StimuliList generator using the Stimuli Generator
    stimulilist_gen = partial(
            framework.stimulilist_default_generator,
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




