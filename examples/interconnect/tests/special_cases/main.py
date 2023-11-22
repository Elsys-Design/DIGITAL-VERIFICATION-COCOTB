import os
import random
from functools import partial

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

    # Loading scenarios
    tasks = []
    for i in range(2):
        stim_list = StimuliList.from_file("inputs/{}/stimulis.json".format(i))
        stim_list.write_to_dir("generated_inputs/{}".format(i))

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

    print("stimulis_inputs test passed")




