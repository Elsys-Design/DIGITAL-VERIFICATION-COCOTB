import cocotb
from cocotb.triggers import Combine, Timer
from cocotb.result import TestFailure
import os

from framework.stimuli_list import StimuliList
from framework.data import Data

from test_utils.filecmp import check_dirs_equal

from tb import TB


@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    # Loading scenarios
    tasks = []
    for i in range(2):
        tasks.append(tb.masters_in[i].start_run("inputs/stimulis{}.json".format(i)))

    # Letting the scenarios execute (passing simulation time)
    await Combine(*tasks)

    # Waiting for the VHDL DMA to finish the transferts
    # It's not a cocotb master but one that is in the DUT so the Combine(*tasks) won't wait for it
    await Timer(1000, units="ns")


    # Printing out_axilite_ram[0] that we wrote directly
    # and out_axilite_ram[1] that was written with the AXI DMA
    print("\n\n")
    memory_final = []
    for i in range(2):
        d = Data(0x0, 2**5)
        tb.out_axilite_rams[i].read_data(d)
        memory_final.append(d)
        print("RAM {}".format(i))
        print(memory_final[i])

    # Testing that both memories contain the same data
    if not memory_final[0].represents_same_data_as(memory_final[1]):
        raise TestFailure("AXI DMA didn't copy ram_out[0] in ram_out[1] properly")


    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitor_data()

    # Comparing stimlogs/ and golden_stimlogs/
    check_dirs_equal("stimlogs", "golden_stimlogs")
