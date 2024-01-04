import os
import logging
from typing import Type

import cocotbext.obi

from ...time import Time
from ...data import Data, DataFormat
from ...data_list import DataList
from ...stimuli import Stimuli, Access
from ...monitors.analysis_port import AnalysisPort
from ...monitors.stimuli_loggers.efficient import EfficientStimuliLogger


class ObiMonitor(cocotbext.obi.ObiMonitor):
    """ """

    def __init__(
        self,
        bus: cocotbext.obi.ObiBus,
        clock,
        default_stimuli_logger_class: Type = EfficientStimuliLogger,
    ) -> None:
        """
        Args:
            bus: The bus to monitor.
            default_stimuli_logger_class: If None, no default StimuliLogger is instancianted.
                If not None, a new StimuliLogger is instanciated with this class.
        """
        super().__init__(bus, clock)

        self.name = bus._name
        self.logger = logging.getLogger("framework.obi.obi_monitor." + self.name)

        # Building analysis ports
        self.write_analysis_port = AnalysisPort()
        self.read_analysis_port = AnalysisPort()
        self.analysis_port = AnalysisPort()

        # Building default logger
        self.default_stimuli_logger = None
        if default_stimuli_logger_class is not None:
            self.default_stimuli_logger = default_stimuli_logger_class(
                os.path.join("stimlogs/" + self.name)
            )
            self.analysis_port.subscribe(self.default_stimuli_logger.write)

        # Id counter for stimulis
        self.current_id = 0

        self.full_be = (2 ** len(self.bus.be)) - 1

    def _on_recv(self, item):
        data_obj = Data(
            item.addr,
            item.data.to_bytes(self.bus.size, byteorder="big"),
            DataFormat(word_size=self.bus.size, addr_size=self.bus.addr_size),
        )

        # Building id and desc
        new_id = "{}_{}".format(self.name, self.current_id)
        self.current_id += 1

        desc = ""
        if item.be != self.full_be:
            desc += "be = {}".format(item.be)

        # Building Stimuli
        stim = Stimuli(
            new_id,
            Access.WRITE if item.we else Access.READ,
            Time.now(),  # TOCHANGE
            DataList([data_obj]),
            desc,
            Time.now(),  # TOCHANGE
            Time.now(),
        )

        # Logging Stimuli
        if stim.access == Access.WRITE:
            self.write_analysis_port.send(stim)
        else:
            self.read_analysis_port.send(stim)
        self.analysis_port.send(stim)

        self.logger.info("Logged " + stim.short_desc())
