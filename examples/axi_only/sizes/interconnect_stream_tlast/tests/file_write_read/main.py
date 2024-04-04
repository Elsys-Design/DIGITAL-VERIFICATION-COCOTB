import os

import cocotb
from cocotb.triggers import Combine

import framework

from test_utils.filecmp import compare_to_golden

from tb import TB


def generate_write_datalist():
    """
    Builds the Data and DataList generators, returns a generated DataList.
    """
    data_gen = framework.StreamDataDefaultGenerator(
        tdest_range=[0x0, 0x1, 0x2],
        size_range=range(1, 0x10),
        word_size_range=range(1, 9),
        ends_with_tlast=None,
    )

    datalist_gen = framework.DataListDefaultGenerator(data_gen, [10])

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
    read_length = [0, 0, 0]
    for data in data_list:
        read_length[data.addr] += len(data.data)

    # Writing data_list to file
    data_filename = "generated_inputs/data.dat"
    data_list.to_file(data_filename)

    # Building tasks

    # Creating a new thread for the axi source
    write_task = cocotb.start_soon(tb.axis_in.write_data_from_file(data_filename))

    read_tasks = []
    for i in range(3):
        # Saving the new thread handle for each sink
        read_tasks.append(
            # Creating a new thread for each sink
            cocotb.start_soon(
                # Function to execute in the thread
                tb.axis_out[i].read_data_to_file(
                    "read_data/{}.dat".format(i), read_length[i]
                )
            )
        )

    # Letting the scenarios execute (passing simulation time)
    await Combine(write_task, *read_tasks)

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitored_data()

    # Comparing stimlogs/ to golden_stimlogs/seed/
    compare_to_golden("stimlogs")
    compare_to_golden("read_data")
