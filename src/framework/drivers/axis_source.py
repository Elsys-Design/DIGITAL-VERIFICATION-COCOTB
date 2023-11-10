import cocotbext.axi
import cocotb
from cocotb.queue import Queue
from cocotb.triggers import RisingEdge, Event

from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data
from ..logger import logger



class AxiStreamSource(cocotbext.axi.AxiStreamSource):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)

        self.bus_size = len(self.bus.tdata.value) // 8
        self.remove_one_tlast = Event()
        cocotb.start_soon(self._remove_tlast())

    async def write_data(self, data):
        # Just a warning in case there is no tkeep but the data doesn't fit exactly in the bus
        if not hasattr(self.bus, "tkeep") and len(data.data) % self.bus_size  != 0:
            logger.warning("Writing data of size {} to AxiStream bus of size {} with no tkeep -> {} 0x0 bytes will" \
                    "be added to the transaction".format(len(data.data), self.bus_size, n%self.bus_size))

        if not data.stream_tlast_end:
            self.remove_one_tlast.set()

        # tkeep is supported by default by cocotbext.axi.AxiStreamSource
        await self.write(cocotbext.axi.AxiStreamFrame(tdata=data.data, tdest=data.addr))
        # For AxiStreamSource, awaiting the write() isn't enough (it just puts it in a queue)
        # We need to explicitly call wait()
        await self.wait()


    async def write_data_from_file(self, filepath):
        data_list = DataList.from_file(filepath, is_stream=True)
        await data_list.write_using(self)

    

    def start_run(self, file):
        return cocotb.start_soon(StimuliList.from_file(file, is_stream=True).run(self))



    async def _remove_tlast(self):
        while True:
            await self.remove_one_tlast.wait()
            await RisingEdge(self.bus.tlast)
            self.bus.tlast.value = 0
            self.remove_one_tlast.clear()
