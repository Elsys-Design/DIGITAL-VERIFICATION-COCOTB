import cocotb
from cocotb.triggers import Combine, Timer
from cocotb.result import TestFailure

from framework.stimuli_list import StimuliList
from framework.data import Data

from tb import TB


@cocotb.test()
async def cocotb_run(dut):
    tb = TB(dut)
    await tb.reset()

    # Loading & executing scenarios
    tasks = []
    for i in range(2):
        scenario = StimuliList.from_file("inputs/stimulis{}.json".format(i))
        tasks.append(cocotb.start_soon(scenario.run(tb.master_in[i])))

    # Waiting for the scenario to finish
    await Combine(*tasks)

    # Waiting for the DMA to finish the transferts
    await Timer(1000, units="ns")


    # Printing out_axilite_ram[0] that we wrote directly
    # and out_axilite_ram[1] that was written with the AXI DMA
    print("\n\n")
    memory_final = []
    for i in range(2):
        memory_final.append(Data.from_memory(tb.out_axilite_ram[i], 0x0, 2**5))
        print("RAM {}".format(i))
        print(memory_final[i])

    if not memory_final[0].represents_same_data_as(memory_final[1]):
        raise TestFailure("AXI DMA didn't copy ram_out[0] in ram_out[1] properly")

