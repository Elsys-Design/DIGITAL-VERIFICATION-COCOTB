import logging
import random
import os
from pathlib import Path
import cocotb
import cocotbext
from cocotb.clock import Clock
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.handle import ModifiableObject

from framework import   AxiBus, AxiMaster, AxiLiteMaster, AxiRam, AxiLiteRam, \
                        AxiMonitor, AxiLiteMonitor, \
                        Data


class TB:

    def __init__(self, dut):
        self.dut = dut

        # Building the clock
        self.clock = Clock(dut.aclk, 10, units="ns")
        cocotb.start_soon(self.clock.start(start_high=False))

        # Building axi and axilite cocotb masters and the monitors on the input buses
        self.bus_in = AxiBus.from_prefix(dut, "axi_in")
        self.master_in = AxiMaster(self.bus_in, dut.aclk, dut.aresetn, reset_active_level=False)
        self.monitor_in = AxiMonitor("axi_in", self.bus_in, dut.aclk, dut.aresetn, reset_active_level=False)

        self.bus_out = []
        self.ram_out = []
        self.monitor_out = []
        
        for name in ["axi_out0", "axi_out1"]:
            self.bus_out.append(AxiBus.from_prefix(dut, name))
            self.ram_out.append(AxiRam(self.bus_out[-1], dut.aclk, dut.aresetn, reset_active_level=False, size=2**16))
            self.monitor_out.append(AxiMonitor(name, self.bus_out[-1], dut.aclk, dut.aresetn, reset_active_level=False))


    async def reset(self):
        self.dut.aresetn.value = 0
        await Timer(10, units="ns")
        self.dut.aresetn.value = 1


    def write_monitor_data(self):
        """
        Writes the data of all the stimuli loggers to their assigned directory.
        To call at the end of the simulation (or in the middle for an update if needed).
        """
        self.monitor_in.default_stimuli_logger.write_to_dir()

        for m_out in self.monitor_out:
            m_out.default_stimuli_logger.write_to_dir()

