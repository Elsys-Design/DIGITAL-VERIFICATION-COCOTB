import os

import cocotb
from cocotb.triggers import Join

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
        max_addr=0x44A1FFFF,
        size_range=range(1, 0x20),
        word_size_range=[2**i for i in range(4)],
    )

    # Building DataList generator using the Data generator
    datalist_gen = framework.DataListDefaultGenerator(data_gen, [1])

    # Building Stimuli generator using the DataList generator
    stimuli_gen = framework.StimuliDefaultGenerator(
        datalist_gen,
        delay_range=range(0, framework.Time(100, "ns").value),
    )

    # Building the StimuliList generator using the Stimuli Generator
    stimulilist_gen = framework.StimuliListDefaultGenerator(stimuli_gen, size_range=[4])

    # Loading scenario
    # StimuliList random generation
    stim_list = stimulilist_gen()
    # Writting the generated DataList to a file
    stim_list.write_to_dir("generated_inputs")

    task = cocotb.start_soon(stim_list.run(tb.master_in))

    # Letting the scenarios execute (passing simulation time)
    await Join(task)

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitor_data()

    # Comparing stimlogs/ and golden_stimlogs/seed/
    compare_to_golden("stimlogs")

    print("random_stimulis test passed")
