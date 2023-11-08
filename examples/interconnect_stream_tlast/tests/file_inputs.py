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

    write_scenario = StimuliList.from_file("inputs/write_stimulis.json", is_stream=True)
    write_task = cocotb.start_soon(write_scenario.run(tb.axis_in))

    read_tasks = []
    for i in range(2):
        scenario = StimuliList.from_file("inputs/read_stimulis{}.json".format(i), is_stream=True)
        read_tasks.append(cocotb.start_soon(scenario.run(tb.axis_out[i])))

    await Combine(write_task, *read_tasks)

