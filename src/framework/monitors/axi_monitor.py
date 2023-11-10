from collections import deque
from cocotbext.axi.axi_channels import AxiAWMonitor, AxiWMonitor, AxiBMonitor, AxiARMonitor, AxiRMonitor
from .base_axi_monitor import BaseAxiMonitor



class AxiMonitor(BaseAxiMonitor):
    def __init__(self, name, bus, clock, reset=None, reset_active_level=None, subscribe_default_logger = True):
        super().__init__(name, bus, clock, reset, reset_active_level, subscribe_default_logger,
                {
                    "aw": AxiAWMonitor,
                    "w": AxiWMonitor,
                    "b": AxiBMonitor,
                    "ar": AxiARMonitor,
                    "r": AxiRMonitor
                }
        )
        


        
