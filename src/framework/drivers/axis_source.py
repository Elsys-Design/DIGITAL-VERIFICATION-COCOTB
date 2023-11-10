import cocotbext.axi
import cocotb
from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data
from ..logger import logger



class AxiStreamSource(cocotbext.axi.AxiStreamSource):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)

        self.bus_size = len(self.bus.tdata.value) // 8

    async def write_data(self, data):
        # Just a warning in case there is no tkeep but the data doesn't fit exactly in the bus
        if not hasattr(self.bus, "tkeep") and len(data.data) % self.bus_size  != 0:
            logger.warning("Writing data of size {} to AxiStream bus of size {} with no tkeep -> {} 0x0 bytes will" \
                    "be added to the transaction".format(len(data.data), self.bus_size, n%self.bus_size))

        # tkeep is supported by default by cocotbext.axi.AxiStreamSource
        await self.write(cocotbext.axi.AxiStreamFrame(tdata=data.data, tdest=data.addr))


    async def write_data_from_file(self, filepath):
        data_list = DataList.from_file(filepath, is_stream=True)
        await data_list.write_using(self)

    

    def start_run(self, file):
        return cocotb.start_soon(StimuliList.from_file(file, is_stream=True).run(self))
