import os

import cocotb
from cocotb.triggers import Combine

from test_utils.filecmp import check_dirs_equal

from framework.data import Data

from tb import TB


async def unit_write(tb):
    """
    Write scenario for axi source
    """
    await tb.axis_in.write_data(Data(0x1, 0x12345678))
    await tb.axis_in.write_data(Data(0x1, 0xABCD))
    await tb.axis_in.write_data(Data(0x1, 0xEF01))

    await tb.axis_in.write_data(Data(0x0, 0x7B))
    await tb.axis_in.write_data(Data(0x0, 0x8B9B))
    await tb.axis_in.write_data(Data(0x0, 0xA0B0C0))

    await tb.axis_in.write_data(Data(0x2, 0x555))


async def read_test(tb, out_idx, length, expected_value):
    """
    Helper function to perform the read and test the output
    """
    d = await tb.axis_out[out_idx].read_word(length)
    print(out_idx, hex(expected_value))
    assert d == expected_value, "{} != {}".format(hex(d), hex(expected_value))


# There is no tkeep on this DUT


async def unit_read0(tb):
    """
    Read scenario for axi sink 0
    """
    await read_test(tb, 0, 1, 0x7B)
    await read_test(tb, 0, 2, 0x8B9B)
    await read_test(tb, 0, 3, 0xA0B0C0)


async def unit_read1(tb):
    """
    Read scenario for axi sink 1
    """
    await read_test(tb, 1, 2, 0x1234)
    await read_test(tb, 1, 2, 0x5678)
    # No tkeep on a bus of size 2
    await read_test(tb, 1, 2, 0xABCD)
    await read_test(tb, 1, 2, 0x0000)
    # The two lines above are similar to:
    await read_test(tb, 1, 4, 0xEF010000)


async def unit_read2(tb):
    """
    Read scenario for axi sink 2
    """
    await read_test(tb, 2, 1, 0x05)
    await read_test(tb, 2, 1, 0x55)


@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    # Starting write on axi stream source
    write_task = cocotb.start_soon(unit_write(tb))

    # Starting read on axi stream sinks
    read_tasks = []
    unit_reads = [unit_read0, unit_read1, unit_read2]
    for i in range(3):
        read_tasks.append(cocotb.start_soon(unit_reads[i](tb)))

    # Letting the scenarios execute (passing simulation time)
    await Combine(write_task, *read_tasks)

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitored_data()

    # Comparing stimlogs/ and golden_stimlogs/
    check_dirs_equal("stimlogs", "golden_stimlogs")
