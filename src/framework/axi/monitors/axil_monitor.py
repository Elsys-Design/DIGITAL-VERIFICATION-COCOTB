from cocotbext.axi.axil_channels import (
    AxiLiteAWMonitor,
    AxiLiteWMonitor,
    AxiLiteBMonitor,
    AxiLiteARMonitor,
    AxiLiteRMonitor,
)

from ...monitors.stimuli_loggers.efficient import EfficientStimuliLogger
from .base_axi_monitor import BaseAxiMonitor


class AxiLiteMonitor(BaseAxiMonitor):
    def __init__(
        self,
        bus,
        clock,
        reset=None,
        reset_active_level=None,
        default_stimuli_logger_class=EfficientStimuliLogger,
        is_big_endian=True,
    ):
        super().__init__(
            bus,
            clock,
            reset,
            reset_active_level,
            default_stimuli_logger_class,
            is_big_endian,
            {
                "aw": AxiLiteAWMonitor,
                "w": AxiLiteWMonitor,
                "b": AxiLiteBMonitor,
                "ar": AxiLiteARMonitor,
                "r": AxiLiteRMonitor,
            },
            "axil_monitor",
        )
