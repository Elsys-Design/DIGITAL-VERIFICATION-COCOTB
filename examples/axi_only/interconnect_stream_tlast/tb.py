import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from cocotbext.axi import AxiStreamBus

from framework import AxiStreamSource, AxiStreamSink, AxiStreamMonitor


class TB:
    def __init__(self, dut):
        self.dut = dut

        self.clock = Clock(dut.aclk, 10, units="ns")
        cocotb.start_soon(self.clock.start(start_high=False))

        self.bus_in = AxiStreamBus.from_prefix(dut, "axis_in")
        self.axis_in = AxiStreamSource(
            self.bus_in, dut.aclk, dut.aresetn, reset_active_level=False
        )
        self.axis_in_monitor = AxiStreamMonitor(
            self.bus_in, dut.aclk, dut.aresetn, reset_active_level=False
        )

        self.bus_out = []
        self.axis_out = []
        self.axis_out_monitors = []
        for i in range(3):
            self.bus_out.append(AxiStreamBus.from_prefix(dut, "axis_out{}".format(i)))
            self.axis_out.append(
                AxiStreamSink(
                    self.bus_out[i], dut.aclk, dut.aresetn, reset_active_level=False
                )
            )
            self.axis_out_monitors.append(
                AxiStreamMonitor(
                    self.bus_out[i],
                    dut.aclk,
                    dut.aresetn,
                    reset_active_level=False,
                )
            )

    async def reset(self):
        # reset
        self.dut.aresetn.value = 0
        await Timer(20 * 10, units="ns")
        self.dut.aresetn.value = 1

    def write_monitored_data(self):
        self.axis_in_monitor.default_stimuli_logger.write_to_dir()

        for out_m in self.axis_out_monitors:
            out_m.default_stimuli_logger.write_to_dir()
