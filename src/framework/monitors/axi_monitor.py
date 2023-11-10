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
        
        # r_queues declared here because we don't even need one deque if we don't support bursts
        # (the r_t is passed directly to the build_read_stimuli)
        self.r_queues = [deque() for _ in range(len(self.r.rid) if self.has_read_id else 1)]


    def build_read_stimuli(self, r_t):
        """
        Overriding base method because AXI transferts can contain read bursts and we need to wait until the last read
        signal to build the stimuli
        """
        rid = r_t.rid if self.has_read_id else 0
        if r_t.rlast:
            super().build_read_stimuli(r_t)
        else:
            self.r_queues[rid].append(r_t)
