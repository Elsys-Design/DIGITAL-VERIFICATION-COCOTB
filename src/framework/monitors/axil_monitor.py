import logging

from cocotbext.axi.axil_channels import (
    AxiLiteAWMonitor,
    AxiLiteWMonitor,
    AxiLiteBMonitor,
    AxiLiteARMonitor,
    AxiLiteRMonitor,
)

from .base_axi_monitor import BaseAxiMonitor
from .stimuli_loggers.efficient import EfficientStimuliLogger


class AxiLiteMonitor(BaseAxiMonitor):
    def __init__(
        self,
        name,
        bus,
        clock,
        reset=None,
        reset_active_level=None,
        default_stimuli_logger_class=EfficientStimuliLogger,
    ):
        super().__init__(
            name,
            bus,
            clock,
            reset,
            reset_active_level,
            default_stimuli_logger_class,
            {
                "aw": AxiLiteAWMonitor,
                "w": AxiLiteWMonitor,
                "b": AxiLiteBMonitor,
                "ar": AxiLiteARMonitor,
                "r": AxiLiteRMonitor,
            },
            logger=logging.getLogger("framework.axi_monitor." + name),
        )
