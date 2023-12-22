import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer

from framework import AxiBus, AxiMaster, AxiRam, AxiMonitor


class TB:
    def __init__(self, dut):
        self.dut = dut

        # Building the clock
        self.clock = Clock(dut.aclk, 10, units="ns")
        cocotb.start_soon(self.clock.start(start_high=False))

        # Building axi and axilite cocotb masters and the monitors on the input buses
        self.bus_in = AxiBus.from_prefix(dut, "in_axi")
        self.master_in = AxiMaster(
            self.bus_in, dut.aclk, dut.aresetn, reset_active_level=False
        )
        self.monitor_in = AxiMonitor(
            "in_axi", self.bus_in, dut.aclk, dut.aresetn, reset_active_level=False
        )

        # Building cocotb's axilite output RAMs and Monitors
        self.out_axi_bus = []
        self.out_axi_rams = []
        self.out_axi_monitors = []
        names = ["out_axi0", "out_axi1"]
        for name in names:
            # Building the bus representation for cocotb
            self.out_axi_bus.append(AxiBus.from_prefix(dut, name))
            # Building the cocotb axilite ram
            self.out_axi_rams.append(
                AxiRam(
                    self.out_axi_bus[-1],
                    dut.aclk,
                    dut.aresetn,
                    reset_active_level=False,
                    size=2**16,
                )
            )
            # Building the monitor
            self.out_axi_monitors.append(
                AxiMonitor(
                    name,
                    self.out_axi_bus[-1],
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
        self.monitor_in.default_stimuli_logger.write_to_dir()

        for m_out in self.out_axi_monitors:
            m_out.default_stimuli_logger.write_to_dir()
