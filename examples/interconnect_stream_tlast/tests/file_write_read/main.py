import os
from functools import partial

import cocotb
import cocotbext
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.result import TestFailure, TestError

from framework.data import stream_data_default_generator
from framework.data_list import datalist_default_generator

from test_utils.filecmp import compare_to_golden

from tb import TB



def generate_write_datalist():
    data_gen = partial(
            stream_data_default_generator,
            tdest_range = [0x0, 0x1, 0x2],
            size_range = range(1, 0x10),
            word_size_range = [2**i for i in range(4)],
            ends_with_tlast = None
    )

    datalist_gen = partial(
            datalist_default_generator,
            data_gen,
            [10]
    )
    
    return datalist_gen()




@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    # Building testbench then reset
    tb = TB(dut)
    await tb.reset()

    # Generating a random DataList to write using axis_in master
    data_list = generate_write_datalist()

    # Computing the length the read requests must be for each AxiStreamSink
    read_length = [0,0,0]
    for data in data_list:
        read_length[data.addr] += len(data.data)

    # Writing data_list to file
    data_filename = "generated_inputs/data.dat"
    data_list.to_file(data_filename)

    # Building tasks
    write_task = cocotb.start_soon(
            tb.axis_in.write_data_from_file(data_filename)
    )

    read_tasks = []
    for i in range(3):
        read_tasks.append(
                cocotb.start_soon(
                    tb.axis_out[i].read_data_to_file("read_data/{}.dat".format(i), read_length[i])
                )
        )

    # Running simulation
    await Combine(write_task, *read_tasks)

    # Writing stimlogs/ directory containing all the monitored data & stimulis
    tb.write_monitored_data()

    # Comparing stimlogs/ to golden_stimlogs/seed/
    compare_to_golden("stimlogs")
    
    compare_to_golden("read_data")
