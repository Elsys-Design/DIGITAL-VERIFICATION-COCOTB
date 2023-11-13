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

        self.has_tkeep = hasattr(self.bus, "tkeep")
        self.has_tlast = hasattr(self.bus, "tlast")
        self.bus_data_size = len(self.bus.tdata.value) // 8

    async def write_data(self, data):
        # Just a warning in case there is no tkeep but the data doesn't fit exactly in the bus
        if not self.has_tkeep and len(data.data) % self.bus_size  != 0:
            logger.warning("Writing data of size {} to AxiStream bus of size {} with no tkeep -> {} * 0x0 bytes will" \
                    "be added to the transaction".format(len(data.data), self.bus_size, len(data.data)%self.bus_size))

        if self.has_tlast and not data.ends_with_tlast:
            cocotb.start_soon(self._remove_one_tlast())

        # tkeep is supported by default by cocotbext.axi.AxiStreamSource
        await self.write_frame(cocotbext.axi.AxiStreamFrame(tdata=data.data, tdest=data.addr))
        # For AxiStreamSource, awaiting the write() isn't enough (it just puts it in a queue)
        # We need to explicitly call wait()
        await self.wait()

    async def write(self, data, tdest : int = 0, tlast : bool = True):
        """
        Helper to write data easily without having to create a data object
        Overrides cocotbext.axi's write method that takes a frame
        """
        if isinstance(data, int):
            data = bytearray(data.to_bytes((data.bit_length()+7)//8, byteorder='big'))
        await self.write_data(Data(tdest, data, tlast))


    async def write_frame(self, frame):
        """
        Gives access to cocotb's AxiStreamSource.write
        """
        await super().write(frame)

    async def write_datalist(self, data_list):
        for d in data_list:
            await self.write_data(d)

    async def write_data_from_file(self, filepath):
        await self.write_datalist(DataList.from_file(filepath, is_stream=True))



    

    def start_run(self, file):
        return cocotb.start_soon(StimuliList.from_file(file, is_stream=True).run(self))



    async def _remove_one_tlast(self):
        await RisingEdge(self.bus.tlast)
        self.bus.tlast.value = 0
        return
