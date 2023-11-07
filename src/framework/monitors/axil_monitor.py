from cocotbext.axi.axil_channels import AxiLiteAWMonitor, AxiLiteWMonitor, AxiLiteBMonitor, AxiLiteARMonitor, AxiLiteRMonitor
from framework.monitors.base_axi_monitor import BaseAxiMonitor



class AxiLiteMonitor(BaseAxiMonitor):
    def __init__(self, name, bus, clock, reset=None, reset_active_level=None):
        super().__init__(name, bus, clock, reset, reset_active_level,
                {
                    "aw": AxiLiteAWMonitor,
                    "w": AxiLiteWMonitor,
                    "b": AxiLiteBMonitor,
                    "ar": AxiLiteARMonitor,
                    "r": AxiLiteRMonitor
                }
        )



