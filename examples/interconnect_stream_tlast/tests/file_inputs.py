import cocotb
import cocotbext
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.result import TestFailure, TestError

from framework.stimuli_list import StimuliList

from tb import TB



@cocotb.test()
async def cocotb_run(dut):
    tb = TB(dut)
    await tb.reset()

    write_task = tb.axis_in.start_run("inputs/write_stimulis.json")

    read_tasks = []
    for i in range(2):
        read_tasks.append(tb.axis_out[i].start_run("inputs/read_stimulis{}.json".format(i)))

    await Combine(write_task, *read_tasks)

