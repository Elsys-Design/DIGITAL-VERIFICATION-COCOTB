import logging
import random
import os
from pathlib import Path
import cocotb
import cocotbext
from cocotb.clock import Clock
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotbext.axi import AxiLiteBus

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
        self.fifo_out_axilite_ram = AxiLiteRam(self.fifo_out_axilite_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**16)
        self.fifo_out_axi_bus = AxiBus.from_prefix(dut, "fifo_out_axi")
        self.fifo_out_axi_ram = AxiRam(self.fifo_out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**16)

        # Building cocotb's axilite output RAMs and Monitors
        self.out_axilite_bus = []
        self.out_axilite_rams = []
        self.out_axilite_monitors = []
        names = ["out0_axilite", "out1_axilite"]
        for name in names:
            # Building the bus representation for cocotb
            self.out_axilite_bus.append(
                    AxiLiteBus.from_prefix(dut, name)
            )
            # Building the cocotb axilite ram
            self.out_axilite_rams.append(
                    AxiLiteRam(self.out_axilite_bus[-1], dut.aclk, dut.aresetn, reset_active_level=False, size=2**16)
            )
            # Building the monitor
            self.out_axilite_monitors.append(
                    AxiLiteMonitor(name, self.out_axilite_bus[-1], dut.aclk, dut.aresetn, reset_active_level=False)
            )

        # Building cocotb's axi output RAM and Monitor
        self.out_axi_bus = AxiBus.from_prefix(dut, "out_axi")
        self.out_axi_ram = AxiRam(self.out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False, size=2**16)
        self.out_axi_monitor = AxiMonitor("out_axi", self.out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False)


    async def reset(self):
        self.dut.aresetn.value = 0
        await Timer(10, units="ns")
        self.dut.aresetn.value = 1


    def write_monitor_data(self):
        """
        Writes the data of all the stimuli loggers to their assigned directory.
        To call at the end of the simulation (or in the middle for an update if needed).
        """
        for m_in in self.monitors_in:
            m_in.default_stimuli_logger.write_to_dir()

        for m_out in self.out_axilite_monitors:
            m_out.default_stimuli_logger.write_to_dir()

        self.out_axi_monitor.default_stimuli_logger.write_to_dir()


    def fill_memories(self):
        """
        Randomly fills all the testbench's rams (cocotb rams).
        """
        mem_gen = lambda : bytearray([random.randrange(0, 2**8) for _ in range(2**16)])
        self.fifo_out_axilite_ram.write(0, mem_gen())
        self.fifo_out_axi_ram.write(0, mem_gen())

        for ram in self.out_axilite_rams:
            ram.write(0, mem_gen())

        self.out_axi_ram.write(0, mem_gen())

