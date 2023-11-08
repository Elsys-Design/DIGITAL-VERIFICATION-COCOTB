from collections import deque
from cocotbext.axi.axi_channels import AxiAWMonitor, AxiWMonitor, AxiBMonitor, AxiARMonitor, AxiRMonitor
from framework.monitors.base_axi_monitor import BaseAxiMonitor



class AxiMonitor(BaseAxiMonitor):
    def __init__(self, name, bus, clock, reset=None, reset_active_level=None):
        super().__init__(name, bus, clock, reset, reset_active_level,
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


    def write_burst_support(self, aw_t, wid):
        awlen = int(aw_t.awlen) # no +1 because we already have the first transfert
        size = 2**int(aw_t.awsize)

        wts = []
        for i in range(awlen):
            wts.append(self.w_queues[wid].popleft())
        return wts


    def read_burst_support(self, ar_t, rid):
        arlen = int(ar_t.arlen)
        size = 2**int(ar_t.arsize)

        rts = []
        for i in range(arlen):
            rts.append(self.r_queues[rid].popleft())

        return rts


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
