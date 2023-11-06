import logging
import random
import os
from pathlib import Path
import cocotb
import cocotbext
from cocotb.clock import Clock
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotbext.axi import AxiLiteBus, AxiLiteRam, AxiBus, AxiRam

from framework.drivers.axi_master import AxiMaster
from framework.drivers.axil_master import AxiLiteMaster
from framework.data import Data


class TB:

    def __init__(self, dut):
        self.dut = dut

        self.clock = Clock(dut.aclk, 10, units="ns")
        cocotb.start_soon(self.clock.start(start_high=False))

        self.bus_in = []
        self.master_in = []
        self.monitor_in = []
        types = [[AxiBus, AxiMaster], [AxiLiteBus, AxiLiteMaster]]
        names = ["axi", "axilite"]
        for i in range(2):
            self.bus_in.append(types[i][0].from_prefix(dut, "{}_interconnect_in".format(names[i])))
            self.master_in.append(types[i][1](self.bus_in[i], dut.aclk, dut.aresetn, reset_active_level=False))


        self.axi_fifo_bus_out = AxiBus.from_prefix(dut, "axi_fifo_out")
        self.axilite_fifo_bus_out = AxiLiteBus.from_prefix(dut, "axilite_fifo_out")
        self.axi_fifo_out = AxiRam(self.axi_fifo_bus_out, dut.aclk, dut.aresetn, reset_active_level=False, size=2**32)
        self.axilite_fifo_out = AxiLiteRam(self.axilite_fifo_bus_out, dut.aclk, dut.aresetn, reset_active_level=False, size=2**32)

        self.bus_out = []
        self.ram_out = []
        for i in range(3):
            self.bus_out.append(AxiLiteBus.from_prefix(dut, "axilite_interconnect_out{}".format(i)))
            self.ram_out.append(AxiLiteRam(self.bus_out[i], dut.aclk, dut.aresetn, reset_active_level=False, size=2**8))


    async def reset(self):
        # reset
        self.dut.aresetn.value = 0
        await Timer(10, units="ns")
        self.dut.aresetn.value = 1


    def print_rams(self):
        # Printing ram_out[0] that we wrote directly
        # and ram_out[1] that was written with the AXI DMA
        print("\n\n")
        for i in range(2):
            print("RAM {}".format(i))
            mem = Data.from_memory(self.ram_out[i], 0x0, 2**5)
            print(mem)



