import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from cocotbext.axi import AxiLiteBus

from framework import (
    AxiBus,
    AxiMaster,
    AxiLiteMaster,
    AxiRam,
    AxiLiteRam,
    AxiMonitor,
    AxiLiteMonitor,
)


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
            "in_axilite": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],
        }
        for name, types in names.items():
            # Building the bus representation for cocotb
            self.bus_in.append(types[0].from_prefix(dut, name))
            # Building the cocotb master
            self.masters_in.append(
                types[1](
                    self.bus_in[-1], dut.aclk, dut.aresetn, reset_active_level=False
                )
            )
            # Building the monitor
            self.monitors_in.append(
                types[2](
                    name,
                    self.bus_in[-1],
                    dut.aclk,
                    dut.aresetn,
                    reset_active_level=False,
                )
            )

        # Building cocotb's axi and axilite output RAMs and Monitors
        self.out_bus = []
        self.out_rams = []
        self.out_monitors = []
        out_names = [
            (
                ["out0_axilite", "out1_axilite"],
                [AxiLiteBus, AxiLiteRam, AxiLiteMonitor],
            ),
            (["out0_axi", "out1_axi"], [AxiBus, AxiRam, AxiMonitor]),
        ]

        for names, types in out_names:
            for name in names:
                # Building the bus representation for cocotb
                self.out_bus.append(types[0].from_prefix(dut, name))
                # Building the cocotb axilite ram
                self.out_rams.append(
                    types[1](
                        self.out_bus[-1],
                        dut.aclk,
                        dut.aresetn,
                        reset_active_level=False,
                        size=2**16,
                    )
                )
                # Building the monitor
                self.out_monitors.append(
                    types[2](
                        name,
                        self.out_bus[-1],
                        dut.aclk,
                        dut.aresetn,
                        reset_active_level=False,
                    )
                )

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

        for m_out in self.out_monitors:
            m_out.default_stimuli_logger.write_to_dir()

    def fill_memories(self):
        """
        Randomly fills all the testbench's rams (cocotb rams).
        """

        def mem_gen():
            return bytearray([random.randrange(0, 2**8) for _ in range(2**16)])

        for ram in self.out_rams:
            ram.write(0, mem_gen())
