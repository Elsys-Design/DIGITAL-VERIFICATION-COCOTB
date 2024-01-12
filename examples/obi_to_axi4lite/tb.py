import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer

from cocotbext.obi import ObiBus
from cocotbext.axi import AxiLiteBus
from framework import ObiMaster, ObiMonitor, AxiLiteRam, AxiLiteMonitor


class TB:
    def __init__(self, dut):
        self.dut = dut

        # Building the clock
        self.clk = Clock(dut.clk, 10, units="ns")
        cocotb.start_soon(self.clk.start(start_high=False))

        obi_bus = ObiBus(dut, "obi")
        self.obi_master = ObiMaster(obi_bus, dut.clk)
        self.obi_monitor = ObiMonitor(obi_bus, dut.clk)

        axil_bus = AxiLiteBus.from_prefix(dut, "axi")
        self.axil_ram = AxiLiteRam(axil_bus, dut.clk, dut.reset_n, False, size=2**16)
        self.axil_monitor = AxiLiteMonitor(
            axil_bus, dut.clk, dut.reset_n, False
        )

    async def reset(self):
        self.dut.reset_n.value = 0
        await Timer(100, "ns")
        self.dut.reset_n.value = 1

    def write_monitor_data(self):
        """
        Writes the data of all the stimuli loggers to their assigned directory.
        To call at the end of the simulation (or in the middle for an update if needed).
        """
        self.obi_monitor.default_stimuli_logger.write_to_dir()
        self.axil_monitor.default_stimuli_logger.write_to_dir()
