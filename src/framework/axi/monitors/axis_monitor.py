import logging
import os

import cocotb
import cocotbext.axi

from ...time import Time
from ...data import Data, DataFormat
from ...data_list import DataList
from ...stimuli import Stimuli, Access
from ...monitors.analysis_port import AnalysisPort
from ...monitors.stimuli_loggers.efficient import EfficientStimuliLogger


class AxiStreamMonitor(cocotbext.axi.AxiStreamMonitor):
    """
    Wrapper for the cocotbext.axi.AxiStreamMonitor but logs Data and Stimuli.

    Attributes:
        name: Name of the monitor.
        logger: Custom logger, should inherit from the framework's logger.

        analysis_port: AnalysisPort to which all Stimulis are sent (as Write Stimulis).

        default_stimuli_logger: Default StimuliLogger connected to the analysis_port.
            Instanciated only if the default_stimuli_logger_class is not None in the constructor.
    """

    def __init__(
        self,
        name,
        bus,
        clock,
        reset=None,
        reset_active_level=None,
        byte_size=None,
        byte_lanes=None,
        default_stimuli_logger_class=EfficientStimuliLogger,
        *args,
        **kwargs,
    ):
        super().__init__(
            bus,
            clock,
            reset,
            reset_active_level,
            byte_size,
            byte_lanes,
            *args,
            **kwargs,
        )

        self.name = name
        self.logger = logging.getLogger("framework.axis_monitor." + name)

        # Id counter for stimulis
        self.current_id = 0

        self.last_start_time = Time(0, "fs")

        # Bus' tdest and data sizes
        self.bus_tdest_size = (
            len(self.bus.tdest.value) // 8 if hasattr(self.bus, "tdest") else 1
        )
        self.bus_data_size = len(self.bus.tdata.value) // 8

        self.has_tlast = hasattr(self.bus, "tlast")

        # Building analysis port
        self.analysis_port = AnalysisPort()

        # Building default logger
        self.default_stimuli_logger = None
        if default_stimuli_logger_class is not None:
            self.default_stimuli_logger = default_stimuli_logger_class(
                os.path.join("stimlogs/" + self.name),
                is_stream_no_tlast=not self.has_tlast,
            )
            self.analysis_port.subscribe(self.default_stimuli_logger.write)

        # Starting monitor task
        cocotb.start_soon(self.monitor_stream())

    def _log_stimuli(
        self,
        tdest: int,
        tdata: bytearray,
        ends_with_tlast: bool,
        start_time: Time,
        end_time: Time,
    ) -> None:
        """
        Helper to log a stimuli.
        """
        # Building a new dformat instance for each new Data object so that they're different objects (it could
        # be built in the constructor as self.dformat and passed as reference to all Data objects but this
        # would mean when a Data object changes it's word_size, all other Data generated here would change too)
        dformat = DataFormat(
            word_size=self.bus_data_size, addr_size=self.bus_tdest_size
        )

        # Building Data
        data = Data(tdest, tdata, ends_with_tlast, dformat)

        # Building Stimuli
        new_id = "{}_{}".format(self.name, self.current_id)
        self.current_id += 1

        stim = Stimuli(
            new_id,
            Access.WRITE,
            start_time - self.last_start_time,
            DataList([data]),
            "",
            start_time,
            end_time,
        )

        self.last_start_time = start_time

        # Logging Stimuli
        self.analysis_port.send(stim)

        self.logger.info("Logged " + stim.short_desc())

    async def monitor_stream(self) -> None:
        """
        Monitors the bus using cocotbext.axi.AxiStreamMonitor.recv() to receive entire frames.
        On buses that don't have a tlast signal, frames are received directly after each unitary transfer.
        On buses that have a tlast signal, frames are received when tlast is asserted.
        /!\\ If tlast is never asserted on a bus that has a tlast signal, we won't log any data (unless there is a tdest
        and it changes).
        """
        while True:
            frame = await self.recv()

            start_time = Time(frame.sim_time_start, "step")
            end_time = Time(frame.sim_time_end, "step")

            if isinstance(frame.tdest, list):
                # In the case there is a tlast but there is interleaving outside of tlast boundaries
                # (tlast stays at 0 but tdest changes)
                # In that case we log a new stimuli for each tdest change
                i = 0
                while i < len(frame.tdest):
                    starti = i
                    i += 1
                    while (
                        i < len(frame.tdest) and frame.tdest[i] == frame.tdest[starti]
                    ):
                        i += 1

                    self._log_stimuli(
                        frame.tdest[starti],
                        frame.tdata[starti:i],
                        i == len(frame.tdest),
                        start_time,
                        end_time,
                    )
            else:
                # When all tdest are the same, the frame returned by self.recv() compacts the list in a single int
                self._log_stimuli(
                    frame.tdest if frame.tdest is not None else 0,
                    frame.tdata,
                    self.has_tlast,
                    start_time,
                    end_time,
                )
