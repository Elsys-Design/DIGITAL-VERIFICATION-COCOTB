import os

import cocotb
import cocotbext
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.result import TestFailure, TestError

from test_utils.filecmp import check_dirs_equal

from framework.data import Data

from tb import TB



async def unit_write(tb):
    await tb.axis_in.write_data(Data.build_word(0x1, 0x12345678))
    await tb.axis_in.write_data(Data.build_word(0x1, 0xABCD))
    await tb.axis_in.write_data(Data.build_word(0x1, 0xEF01))

    await tb.axis_in.write_data(Data.build_word(0x0, 0x7B, False))
    await tb.axis_in.write_data(Data.build_word(0x0, 0x8B9B, False))
    await tb.axis_in.write_data(Data.build_word(0x0, 0xA0B0C0, True))

    await tb.axis_in.write_data(Data.build_word(0x2, 0x555))


async def read_test(tb, out_idx, length, expected_value):
    d = await tb.axis_out[out_idx].read_word(length)
    print(out_idx, hex(expected_value))
    assert d == expected_value, "{} != {}".format(hex(d), hex(expected_value))


# There is a tkeep on this DUT

async def unit_read0(tb):
    await read_test(tb, 0, 3, 0x7B8B9B)
    await read_test(tb, 0, 3, 0xA0B0C0)

async def unit_read1(tb):
    await read_test(tb, 1, 4, 0x12345678)
    await read_test(tb, 1, 2, 0xABCD)
    await read_test(tb, 1, 2, 0xEF01)

async def unit_read2(tb):
    await read_test(tb, 2, 2, 0x555)



@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    write_task = cocotb.start_soon(unit_write(tb))

    read_tasks = []
    unit_reads = [unit_read0, unit_read1, unit_read2]
    for i in range(3):
        read_tasks.append(cocotb.start_soon(unit_reads[i](tb)))

    await Combine(write_task, *read_tasks)

    tb.write_monitored_data()

    check_dirs_equal("stimlogs", "golden_stimlogs")
