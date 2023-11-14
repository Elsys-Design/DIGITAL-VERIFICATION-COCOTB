import logging
import random
import os
from pathlib import Path
import cocotb
import cocotbext
from cocotb.clock import Clock
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotbext.axi import AxiStreamBus

from framework.drivers.axis_source import AxiStreamSource
from framework.drivers.axis_sink import AxiStreamSink
from framework.monitors.axis_monitor import AxiStreamMonitor
from framework.monitors.analysis_port import AnalysisPort




class TB:

    def __init__(self, dut):
        self.dut = dut

        # Building the clock
        self.clock = Clock(dut.aclk, 10, units="ns")
        cocotb.start_soon(self.clock.start(start_high=False))

        # Building axis_in source and monitor
        self.bus_in = AxiStreamBus.from_prefix(dut, "axis_in")
        self.axis_in = AxiStreamSource(self.bus_in, dut.aclk, dut.aresetn, reset_active_level=False)
        self.axis_in_monitor = AxiStreamMonitor("axis_in", self.bus_in, dut.aclk, dut.aresetn, reset_active_level=False)

        # Building axis_out sinks and monitors
        self.bus_out = []
        self.axis_out = []
        self.axis_out_monitors = []
        for i in range(3):
            self.bus_out.append(AxiStreamBus.from_prefix(dut, "axis_out{}".format(i)))
            self.axis_out.append(AxiStreamSink(self.bus_out[i], dut.aclk, dut.aresetn, reset_active_level=False))
            self.axis_out_monitors.append(AxiStreamMonitor("axis_out{}".format(i), self.bus_out[i], dut.aclk, dut.aresetn, reset_active_level=False))


    async def reset(self):
        self.dut.aresetn.value = 0
        await Timer(10*10, units="ns")
        self.dut.aresetn.value = 1


    def write_monitored_data(self):
        """
        Writes the data of all the stimuli loggers to their assigned directory.
        To call at the end of the simulation (or in the middle for an update if needed).
        """
        self.axis_in_monitor.default_logger.write_to_dir()

        for out_m in self.axis_out_monitors:
            out_m.default_logger.write_to_dir()


