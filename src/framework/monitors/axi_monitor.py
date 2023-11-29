from collections import deque
import logging

from cocotbext.axi.axi_channels import AxiAWMonitor, AxiWMonitor, AxiBMonitor, AxiARMonitor, AxiRMonitor

from .base_axi_monitor import BaseAxiMonitor
from .stimuli_loggers.efficient import EfficientStimuliLogger



class AxiMonitor(BaseAxiMonitor):
    def __init__(self, name, bus, clock, reset=None, reset_active_level=None,
                 default_stimuli_logger_class = EfficientStimuliLogger):
        super().__init__(name, bus, clock, reset, reset_active_level, default_stimuli_logger_class,
                {
                    "aw": AxiAWMonitor,
                    "w": AxiWMonitor,
                    "b": AxiBMonitor,
                    "ar": AxiARMonitor,
                    "r": AxiRMonitor
                },
                logger = logging.getLogger("framework.axi_monitor." + name)
        )


        
