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


class TB:

    def __init__(self, dut):
        self.dut = dut

        self.clock = Clock(dut.aclk, 10, units="ns")
        cocotb.start_soon(self.clock.start(start_high=False))

        self.bus_in = AxiStreamBus.from_prefix(dut, "axis_in")
        self.axis_in = AxiStreamSource(self.bus_in, dut.aclk, dut.aresetn, reset_active_level=False)

        self.bus_out = []
        self.axis_out = []
        self.axis_out_monitor = []
        for i in range(2):
            self.bus_out.append(AxiStreamBus.from_prefix(dut, "axis_out{}".format(i)))
            self.axis_out.append(AxiStreamSink(self.bus_out[i], dut.aclk, dut.aresetn, reset_active_level=False))

    async def reset(self):
        # reset
        self.dut.aresetn.value = 0
        await Timer(10, units="ns")
        self.dut.aresetn.value = 1

