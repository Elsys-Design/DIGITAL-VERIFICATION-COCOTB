import cocotb
import cocotbext.axi

from ..time import Time
from ..data import Data, DataFormat
from ..data_list import DataList
from ..stimuli import Stimuli, Access
from ..stimuli_list import StimuliList
from .analysis_port import AnalysisPort

from .stimuli_loggers.efficient import EfficientStimuliLogger



class AxiStreamMonitor(cocotbext.axi.AxiStreamMonitor):
    """
    Wrapper for the cocotbext.axi.AxiStreamMonitor but logs Data and Stimuli.
    """

    def __init__(self, name, bus, clock, reset=None, reset_active_level=None, byte_size=None, byte_lanes=None,
                 subscribe_default_logger = True, *args, **kwargs):
        super().__init__(bus, clock, reset, reset_active_level, byte_size, byte_lanes, *args, **kwargs)

        self.name = name
        
        # Id counter for stimulis
        self.current_id = 0

        self.last_end_time = Time(0, 'fs')

        
        # Bus' tdest and data sizes
        self.bus_tdest_size = len(self.bus.tdest.value) // 8 if hasattr(self.bus, "tdest") else 1
        self.bus_data_size = len(self.bus.tdata.value) // 8


        # Building analysis port
        self.analysis_port = AnalysisPort()

        # Building default logger
        self.default_logger = None
        if subscribe_default_logger:
            self.default_logger = EfficientStimuliLogger(
                    "stimlogs/" + self.name,
                    is_stream_no_tlast = not hasattr(self.bus, "tlast")
            )
            self.analysis_port.subscribe(self.default_logger.recv)
        

        # Starting monitor task
        cocotb.start_soon(self.monitor_stream())


    async def monitor_stream(self):
        """
        Monitors the bus using cocotbext.axi.AxiStreamMonitor.recv() to receive entire frames.
        On buses that don't have a tlast signal, frames are received directly after each unitary transfer.
        On buses that have a tlast signal, frames are received when tlast is asserted.
        /!\ If tlast is never asserted on a bus that has a tlast signal, we won't log any data.
        """
        while True:
            await self.wait()

            start_time = Time.now()

            frame = await self.recv()

            end_time = Time.now()

            def log_stimuli(tdest, tdata, ends_with_tlast):
                """
                Helper to log a stimuli.
                """
                # Building a new dformat instance for each new Data object so that they're different objects (it could
                # be built in the constructor as self.dformat and passed as reference to all Data objects but this
                # would mean when a Data object changes it's word_size, all other Data generated here would change too)
                dformat = DataFormat(
                            word_size = self.bus_data_size,
                            addr_size = self.bus_tdest_size
                )

                # Building Data
                data = Data(tdest, tdata, ends_with_tlast, dformat)

                # Building Stimuli
                new_id = "{}_{}".format(self.name, self.current_id)
                self.current_id += 1

                s = Stimuli(
                        new_id,
                        Access.WRITE,
                        start_time - self.last_end_time,
                        DataList([data]),
                        "",
                        start_time,
                        end_time
                )

                self.last_end_time = end_time

                # Logging Stimuli
                self.analysis_port.send(s)


            if isinstance(frame.tdest, list):
                # In the case there is a tlast but there is interleaving outside of tlast boundaries
                # (tlast stays at 0 but tdest changes)
                # In that case we log a new stimuli for each tdest change
                i = 0
                while i < len(frame.tdest):
                    starti = i
                    i += 1
                    while i < len(frame.tdest) and frame.tdest[i] == frame.tdest[starti]:
                        i += 1

                    log_stimuli(frame.tdest[starti], frame.tdata[starti:i], i==len(frame.tdest))
            else:
                # When all tdest are the same, the frame returned by self.recv() compacts the list in a single int
                log_stimuli(frame.tdest, frame.tdata, True)

