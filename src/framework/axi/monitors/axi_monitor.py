from cocotbext.axi.axi_channels import (
    AxiAWMonitor,
    AxiWMonitor,
    AxiBMonitor,
    AxiARMonitor,
    AxiRMonitor,
)

from ...monitors.stimuli_loggers.efficient import EfficientStimuliLogger
from .base_axi_monitor import BaseAxiMonitor


class AxiMonitor(BaseAxiMonitor):
    def __init__(
        self,
        bus,
        clock,
        reset=None,
        reset_active_level=None,
        default_stimuli_logger_class=EfficientStimuliLogger,
    ):
        super().__init__(
            bus,
            clock,
            reset,
            reset_active_level,
            default_stimuli_logger_class,
            {
                "aw": AxiAWMonitor,
                "w": AxiWMonitor,
                "b": AxiBMonitor,
                "ar": AxiARMonitor,
                "r": AxiRMonitor,
            },
            "axi_monitor",
        )
