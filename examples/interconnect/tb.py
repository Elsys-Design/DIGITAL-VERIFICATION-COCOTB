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
from framework.monitors.axi_monitor import AxiMonitor
from framework.monitors.axil_monitor import AxiLiteMonitor
from framework.data import Data
from framework.monitors.stimuli_logger import StimuliLogger


class TB:

    def __init__(self, dut):
        self.dut = dut

        self.clock = Clock(dut.aclk, 10, units="ns")
        cocotb.start_soon(self.clock.start(start_high=False))

        self.bus_in = []
        self.masters_in = []
        self.monitors_in = []
        types = [[AxiBus, AxiMaster, AxiMonitor], [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor]]
        names = ["axi", "axilite"]
        for i in range(2):
            name = "in_{}".format(names[i])
            self.bus_in.append(types[i][0].from_prefix(dut, name))
            self.masters_in.append(types[i][1](self.bus_in[i], dut.aclk, dut.aresetn, reset_active_level=False))
            self.monitors_in.append(types[i][2](name, self.bus_in[i], dut.aclk, dut.aresetn, reset_active_level=False))
            self.monitors_in[i].analysis_port.subscribe(StimuliLogger("stimlogs/" + name).recv)


        self.fifo_out_axilite_bus = AxiLiteBus.from_prefix(dut, "fifo_out_axilite")
        self.fifo_out_axilite = AxiLiteRam(self.fifo_out_axilite_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**32)
        self.fifo_out_axi_bus = AxiBus.from_prefix(dut, "fifo_out_axi")
        self.fifo_out_axi = AxiRam(self.fifo_out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**32)

        self.out_axilite_bus = []
        self.out_axilite_rams = []
        self.out_axilite_monitors = []
        for i in range(2):
            name = "out{}_axilite".format(i)
            self.out_axilite_bus.append(AxiLiteBus.from_prefix(dut, name))
            self.out_axilite_rams.append(AxiLiteRam(self.out_axilite_bus[i], dut.aclk, dut.aresetn, reset_active_level=False, size=2**8))
            self.out_axilite_monitors.append(AxiLiteMonitor(name, self.out_axilite_bus[i], dut.aclk, dut.aresetn, reset_active_level=False))
            self.monitors_in[i].analysis_port.subscribe(StimuliLogger("stimlogs/" + name).recv)

        self.out_axi_bus = AxiLiteBus.from_prefix(dut, "out_axi")
        self.out_axi_ram = AxiLiteRam(self.out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**8)
        self.out_axi_monitor = AxiMonitor("out_axi", self.out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False)
        self.out_axi_monitor.analysis_port.subscribe(StimuliLogger("stimlogs/out_axi").recv)


    async def reset(self):
        # reset
        self.dut.aresetn.value = 0
        await Timer(10, units="ns")
        self.dut.aresetn.value = 1


