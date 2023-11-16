from collections import deque
import logging

from cocotbext.axi.axil_channels import AxiLiteAWMonitor, AxiLiteWMonitor, AxiLiteBMonitor, AxiLiteARMonitor, AxiLiteRMonitor

from .base_axi_monitor import BaseAxiMonitor



class AxiLiteMonitor(BaseAxiMonitor):
    def __init__(self, name, bus, clock, reset=None, reset_active_level=None, subscribe_default_stimuli_logger = True):
        super().__init__(name, bus, clock, reset, reset_active_level, subscribe_default_stimuli_logger,
                {
                    "aw": AxiLiteAWMonitor,
                    "w": AxiLiteWMonitor,
                    "b": AxiLiteBMonitor,
                    "ar": AxiLiteARMonitor,
                    "r": AxiLiteRMonitor
                },
                logger = logging.getLogger("framework.axi_monitor." + name)
        )

