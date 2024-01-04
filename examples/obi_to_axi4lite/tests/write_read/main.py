import os

import cocotb
from cocotb.triggers import Join

from test_utils.filecmp import check_dirs_equal

from tb import TB


@cocotb.test()
async def write_read(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    task = tb.obi_master.init_run("inputs/stimulis.json")

    await Join(task)

    # Writing the stimulis and data logged by monitors (we use efficient loggers)
    tb.write_monitor_data()

    # Comparing stimlogs/ and golden_stimlogs/seed/
    check_dirs_equal("stimlogs", "golden_stimlogs")
