import os

import cocotb

from framework import Data
from test_utils.filecmp import check_dirs_equal

from tb import TB


@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    d = Data.build_empty(0x10, 4)
    await tb.master.atomic_read_data(d)
    d.data = int(0xABCD).to_bytes(4, "big")
    await tb.master.atomic_write_data(d)

    d = Data.build_empty(0x1020, 4)
    await tb.master.atomic_read_data(d)
    d.data = int(0x1234).to_bytes(4, "big")
    await tb.master.atomic_write_data(d)

    # Writing the stimulis and data logged by monitors (we use efficient loggers)
    tb.write_monitor_data()

    # Comparing stimlogs/ and golden_stimlogs/seed/
    check_dirs_equal("stimlogs", "golden_stimlogs")
