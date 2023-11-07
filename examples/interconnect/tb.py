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
            self.bus_in.append(types[i][0].from_prefix(dut, "in_{}".format(names[i])))
            self.master_in.append(types[i][1](self.bus_in[i], dut.aclk, dut.aresetn, reset_active_level=False))


        self.fifo_out_axilite_bus = AxiLiteBus.from_prefix(dut, "fifo_out_axilite")
        self.fifo_out_axilite = AxiLiteRam(self.fifo_out_axilite_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**32)
        self.fifo_out_axi_bus = AxiBus.from_prefix(dut, "fifo_out_axi")
        self.fifo_out_axi = AxiRam(self.fifo_out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**32)

        self.out_axilite_bus = []
        self.out_axilite_ram = []
        for i in range(2):
            self.out_axilite_bus.append(AxiLiteBus.from_prefix(dut, "out{}_axilite".format(i)))
            self.out_axilite_ram.append(AxiLiteRam(self.out_axilite_bus[i], dut.aclk, dut.aresetn, reset_active_level=False, size=2**8))

        self.out_axi_bus = AxiLiteBus.from_prefix(dut, "out_axi")
        self.out_axi_ram = AxiLiteRam(self.out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**8)


    async def reset(self):
        # reset
        self.dut.aresetn.value = 0
        await Timer(10, units="ns")
        self.dut.aresetn.value = 1


