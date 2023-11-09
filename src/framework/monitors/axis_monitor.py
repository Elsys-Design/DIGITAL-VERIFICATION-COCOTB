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
    def __init__(self, name, bus, clock, reset=None, reset_active_level=None, byte_size=None, byte_lanes=None,
                 subscribe_default_logger = True, *args, **kwargs):
        super().__init__(bus, clock, reset, reset_active_level, byte_size, byte_lanes, *args, **kwargs)

        cocotb.start_soon(self.monitor_stream())

        self.analysis_port = AnalysisPort()

        self.current_id = 0
        self.name = name

        self.last_end_time = Time(0, 'fs')

        self.default_logger = None
        if subscribe_default_logger:
            self.default_logger = EfficientStimuliLogger(
                    "stimlogs/" + self.name,
                    is_stream_no_tlast = not hasattr(self.bus, "tlast")
            )
            self.analysis_port.subscribe(self.default_logger.recv)


    async def monitor_stream(self):
        size = len(self.bus.tdata)//8

        while True:
            await self.wait()

            start_time = Time.now()

            frame = await self.recv()

            end_time = Time.now()

            d = Data(frame.tdest, frame.tdata, True, DataFormat(size))

            new_id = "{}_{}".format(self.name, self.current_id)
            self.current_id += 1

            s = Stimuli(
                    new_id,
                    Access.WRITE,
                    start_time - self.last_end_time,
                    DataList([d]),
                    "",
                    start_time,
                    end_time
            )

            self.last_end_time = end_time

            self.analysis_port.send(s)
