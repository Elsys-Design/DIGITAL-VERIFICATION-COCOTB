import os

import cocotb
from cocotb.triggers import Combine

import framework

from test_utils.filecmp import compare_to_golden

from tb import TB


@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    # Building Data generator
    data_gen = framework.DataDefaultGenerator(
        min_addr=0x44A00000,
        max_addr=0x44A4FFFF,
        size_range=range(1, 0x20),
        word_size_range=[2**i for i in range(4)],
    )

    # Building DataList generator using the Data generator
    datalist_gen = framework.DataListDefaultGenerator(data_gen, [10])

    # Loading scenarios
    tasks = []
    for i in range(2):
        # DataList random generation
        data_list = datalist_gen()
        data_filepath = "generated_inputs/{}.dat".format(i)
        # Writting the generated DataList to a file
        data_list.to_file(data_filepath)

        # Saving the new thread handle for each master
        tasks.append(
            # Creating a new thread for each master
            cocotb.start_soon(
                # Function to execute in the thread
                tb.masters_in[i].write_data_from_file(data_filepath)
            )
        )

    # Letting the scenarios execute (passing simulation time)
    await Combine(*tasks)

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitor_data()

    # Comparing stimlogs/ and golden_stimlogs/seed/
    compare_to_golden("stimlogs")

    print("file_write test passed")
