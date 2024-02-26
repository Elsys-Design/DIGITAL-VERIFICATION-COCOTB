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
    def __init__(self, dut, is_big_endian=True):
        self.dut = dut

        # Building the clock
        self.clock = Clock(dut.aclk, 10, units="ns")
        cocotb.start_soon(self.clock.start(start_high=False))

        # Building axi and axilite cocotb masters and the monitors on the input buses
        self.bus_in = []
        self.masters_in = []
        self.monitors_in = []

        # Axi master interface
        self.bus_in.append(AxiBus.from_prefix(dut, "in_axi"))
        self.masters_in.append(
            AxiMaster(
                self.bus_in[0],
                dut.aclk,
                dut.aresetn,
                reset_active_level=False,
            )
        )
        self.monitors_in.append(
            AxiMonitor(
                self.bus_in[0],
                dut.aclk,
                dut.aresetn,
                reset_active_level=False,
                is_big_endian=is_big_endian,
            )
        )

        # AxiLite master interface
        self.bus_in.append(AxiLiteBus.from_prefix(dut, "in_axilite"))
        self.masters_in.append(
            AxiLiteMaster(
                self.bus_in[1],
                dut.aclk,
                dut.aresetn,
                reset_active_level=False,
            )
        )
        self.monitors_in.append(
            AxiLiteMonitor(
                self.bus_in[1],
                dut.aclk,
                dut.aresetn,
                reset_active_level=False,
                is_big_endian=is_big_endian,
            )
        )

        # Building the cocotb RAMs for each AXI Data FIFO's output bus
        self.fifo_out_axilite_bus = AxiLiteBus.from_prefix(dut, "fifo_out_axilite")
        self.fifo_out_axilite_ram = AxiLiteRam(
            self.fifo_out_axilite_bus,
            dut.aclk,
            dut.aresetn,
            reset_active_level=False,
            size=2**16,
        )
        self.fifo_out_axi_bus = AxiBus.from_prefix(dut, "fifo_out_axi")
        self.fifo_out_axi_ram = AxiRam(
            self.fifo_out_axi_bus,
            dut.aclk,
            dut.aresetn,
            reset_active_level=False,
            size=2**16,
        )

        # Building cocotb's axilite output RAMs and Monitors
        self.out_axilite_bus = []
        self.out_axilite_rams = []
        self.out_axilite_monitors = []
        names = ["out0_axilite", "out1_axilite"]
        for name in names:
            # Building the bus representation for cocotb
            self.out_axilite_bus.append(AxiLiteBus.from_prefix(dut, name))
            # Building the cocotb axilite ram
            self.out_axilite_rams.append(
                AxiLiteRam(
                    self.out_axilite_bus[-1],
                    dut.aclk,
                    dut.aresetn,
                    reset_active_level=False,
                    size=2**16,
                )
            )
            # Building the monitor
            self.out_axilite_monitors.append(
                AxiLiteMonitor(
                    self.out_axilite_bus[-1],
                    dut.aclk,
                    dut.aresetn,
                    reset_active_level=False,
                    is_big_endian=is_big_endian,
                )
            )

        # Building cocotb's axi output RAM and Monitor
        self.out_axi_bus = AxiBus.from_prefix(dut, "out_axi")
        self.out_axi_ram = AxiRam(
            self.out_axi_bus,
            dut.aclk,
            dut.aresetn,
            reset_active_level=False,
            size=2**16,
        )
        self.out_axi_monitor = AxiMonitor(
            self.out_axi_bus, dut.aclk, dut.aresetn, reset_active_level=False
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

        for m_out in self.out_axilite_monitors:
            m_out.default_stimuli_logger.write_to_dir()

        self.out_axi_monitor.default_stimuli_logger.write_to_dir()

    def fill_memories(self):
        """
        Randomly fills all the testbench's rams (cocotb rams).
        """

        def mem_gen():
            return bytearray([random.randrange(0, 2**8) for _ in range(2**16)])

        self.fifo_out_axilite_ram.write(0, mem_gen())
        self.fifo_out_axi_ram.write(0, mem_gen())

        for ram in self.out_axilite_rams:
            ram.write(0, mem_gen())

        self.out_axi_ram.write(0, mem_gen())
