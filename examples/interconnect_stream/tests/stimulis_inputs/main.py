import os

import cocotb
import cocotbext
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.result import TestFailure, TestError

from test_utils.filecmp import check_dirs_equal

from tb import TB



@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    # Starting write stimulis on axi stream source
    write_task = tb.axis_in.start_run("inputs/write_stimulis.json")

    # Starting read stimulis on axi stream sink
    read_tasks = []
    for i in range(3):
        read_tasks.append(tb.axis_out[i].start_run("inputs/read_stimulis{}.json".format(i)))

    # Letting the scenarios execute (passing simulation time)
    await Combine(write_task, *read_tasks)

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitored_data()

    # Comparing stimlogs/ and golden_stimlogs/
    check_dirs_equal("stimlogs", "golden_stimlogs")

