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
from framework.monitors.stimuli_loggers.efficient import EfficientStimuliLogger


StimuliLogger = EfficientStimuliLogger


class TB:

    def __init__(self, dut):
        self.dut = dut

        self.clock = Clock(dut.aclk, 10, units="ns")
        cocotb.start_soon(self.clock.start(start_high=False))

        # Building axi and axilite cocotb masters and the monitors on the input buses
        self.bus_in = []
        self.masters_in = []
        self.monitors_in = []
        # This is just to build both axi and axilite elements in one loop
        names = {
                "in_axi": [AxiBus, AxiMaster, AxiMonitor],
                "in_axilite": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor]
        }
        for name, types in names.items():
            # Building the bus representation for cocotb
            self.bus_in.append(
                    types[0].from_prefix(dut, name)
            )
            # Building the cocotb master
            self.masters_in.append(
                    types[1](self.bus_in[-1], dut.aclk, dut.aresetn, reset_active_level=False)
            )
            # Building the monitor
            self.monitors_in.append(
                    types[2](name, self.bus_in[-1], dut.aclk, dut.aresetn, reset_active_level=False)
            )


        # Building the cocotb RAMs for each AXI Data FIFO's output bus
        self.fifo_out_axilite_bus = AxiLiteBus.from_prefix(dut, "fifo_out_axilite")
        self.fifo_out_axilite = AxiLiteRam(self.fifo_out_axilite_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**32)
        self.fifo_out_axi_bus = AxiBus.from_prefix(dut, "fifo_out_axi")
        self.fifo_out_axi = AxiRam(self.fifo_out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**32)

        # Building cocotb's axilite output RAMs and Monitors
        self.out_axilite_bus = []
        self.out_axilite_rams = []
        self.out_axilite_monitors = []
        names = ["out0_axilite", "out1_axilite"]
        for name in names:
            self.out_axilite_bus.append(
                    AxiLiteBus.from_prefix(dut, name)
            )
            self.out_axilite_rams.append(
                    AxiLiteRam(self.out_axilite_bus[-1], dut.aclk, dut.aresetn, reset_active_level=False, size=2**8)
            )
            self.out_axilite_monitors.append(
                    AxiLiteMonitor(name, self.out_axilite_bus[-1], dut.aclk, dut.aresetn, reset_active_level=False)
            )

        # Building cocotb's axi output RAM and Monitor
        self.out_axi_bus = AxiLiteBus.from_prefix(dut, "out_axi")
        self.out_axi_ram = AxiLiteRam(self.out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**8)
        self.out_axi_monitor = AxiMonitor("out_axi", self.out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False)


    async def reset(self):
        # reset
        self.dut.aresetn.value = 0
        await Timer(10, units="ns")
        self.dut.aresetn.value = 1


