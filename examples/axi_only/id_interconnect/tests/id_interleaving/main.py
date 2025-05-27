import os

import cocotb
from cocotb.triggers import Combine


from test_utils.filecmp import compare_to_golden

from tb import TB


@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    e0 = tb.master_in.init_read(0x44A00000, 1000)
    e1 = tb.master_in.init_read(0x44A10000, 4)

    # Letting the scenarios execute (passing simulation time)
    await Combine(e0.wait(), e1.wait())

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitor_data()

    # Comparing stimlogs/ and golden_stimlogs/seed/
    compare_to_golden("stimlogs")

    print("id_interleaving test passed")
