import cocotb
import cocotbext.axi

from framework.time import Time
from framework.data import Data, DataFormat
from framework.data_list import DataList
from framework.stimuli import Stimuli, Access
from framework.stimuli_list import StimuliList
from framework.monitors.analysis_port import AnalysisPort



class AxiStreamMonitor(cocotbext.axi.AxiStreamMonitor):
    def __init__(self, name, bus, clock, reset=None, reset_active_level=None, byte_size=None, byte_lanes=None, *args, **kwargs):
        super().__init__(bus, clock, reset, reset_active_level, byte_size, byte_lanes, *args, **kwargs)

        cocotb.start_soon(self.monitor_stream())

        self.analysis_port = AnalysisPort()

        self.current_id = 0
        self.name = name


        self.d = None
        self.start_time = Time(0, 'fs')
        self.end_time = Time(0, 'fs')
        self.last_start_time = Time(0, 'fs')

        self.tdest_size = (len(self.bus.tdest)+7)//8

    async def monitor_stream(self):
        size = len(self.bus.tdata)//8

        frame = None

        while True:
            await self.wait()

            self.start_time = Time.now()

            if frame == None:
                frame = await self.recv()
            self.d = Data(frame.tdest, frame.tdata, hasattr(self.bus, "tlast"), DataFormat(size, addr_size = self.tdest_size))

            if hasattr(self.bus, "tlast"):
                frame = None
                self.end_time = Time.now()
            else:
                frame = await self.recv()
                while frame.tdest == self.d.addr:
                    self.d.data += frame.tdata
                    self.end_time = Time.now()
                    frame = await self.recv()


            self._build_new_stimuli()



    def _build_new_stimuli(self):
            new_id = "{}_{}".format(self.name, self.current_id)
            self.current_id += 1

            s = Stimuli(
                    new_id,
                    Access.WRITE,
                    self.start_time - self.last_start_time,
                    DataList([self.d]),
                    "NOT IMPLEMENTED",
                    self.start_time,
                    self.end_time
            )

            self.last_start_time = self.start_time

            self.analysis_port.send(s)


    def __del__(self):
        if hasattr(self.bus, "tlast"):
            return

        self._build_new_stimuli()


