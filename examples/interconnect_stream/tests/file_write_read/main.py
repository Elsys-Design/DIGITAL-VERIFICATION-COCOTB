import os
from functools import partial

import cocotb
import cocotbext
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.result import TestFailure, TestError

import framework

from test_utils.filecmp import compare_to_golden

from tb import TB



def generate_write_datalist():
    """
    Builds the Data and DataList generators, returns a generated DataList.
    """
    data_gen = partial(
            framework.stream_data_default_generator,
            tdest_range = [0x0, 0x1, 0x2],
            size_range = range(1, 0x10),
            word_size_range = [2**i for i in range(4)]
    )

    datalist_gen = partial(
            framework.datalist_default_generator,
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

    # Writting the generated DataList to a file
    data_filename = "generated_inputs/data.dat"
    data_list.to_file(data_filename)


    # Computing the length the read requests must be for each AxiStreamSink
    read_length = [0,0,0]
    for data in data_list:
        # There is no tkeep in this test
        # and with the dwidth converter, we need to make sure all transfers' sizes are a multiple of the bus size
        actual_length = len(data.data)
        mod = actual_length % 4
        if mod != 0:
            actual_length += 4 - mod
        read_length[data.addr] += actual_length

    
    # Building tasks

    # Creating a new thread for the axi source
    write_task = cocotb.start_soon(
            tb.axis_in.write_data_from_file(data_filename)
    )
    # axi sinks
    read_tasks = []
    for i in range(3):
        # Saving the new thread handle for each sink
        read_tasks.append(
                # Creating a new thread for each sink
                cocotb.start_soon(
                    # Function to execute in the thread
                    tb.axis_out[i].read_data_to_file("read_data/{}.dat".format(i), read_length[i])
                )
        )

    # Letting the scenarios execute (passing simulation time)
    await Combine(write_task, *read_tasks)

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitored_data()

    # Comparing stimlogs/ to golden_stimlogs/seed/
    compare_to_golden("stimlogs")
    compare_to_golden("read_data")
    
