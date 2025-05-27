import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer

from cocotbext.obi import ObiBus
from framework import ObiMaster, ObiRam, ObiMonitor


class TB:
    def __init__(self, dut, is_big_endian=True):
        self.dut = dut

        # Building the clock
        self.clk = Clock(dut.clk, 10, units="ns")
        cocotb.start_soon(self.clk.start(start_high=False))

        m_bus = ObiBus(dut, "m")
        self.master = ObiMaster(m_bus, dut.clk)
        self.monitor_in = ObiMonitor(m_bus, dut.clk, is_big_endian=is_big_endian)

        self.slaves = []
        self.monitors_out = []
        for i in range(2):
            s_bus = ObiBus(dut, f"s{i}")
            self.slaves.append(ObiRam(s_bus, dut.clk, 0x1000))
            self.monitors_out.append(
                ObiMonitor(s_bus, dut.clk, is_big_endian=is_big_endian)
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
        self.monitor_in.default_stimuli_logger.write_to_dir()

        for m_out in self.monitors_out:
            m_out.default_stimuli_logger.write_to_dir()
