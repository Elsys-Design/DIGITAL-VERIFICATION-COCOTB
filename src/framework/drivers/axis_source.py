import cocotbext.axi
import cocotb
from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data



class AxiStreamSource(cocotbext.axi.AxiStreamSource):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)

    async def write_data(self, data):
        await self.write(cocotbext.axi.AxiStreamFrame(tdata=data.data, tdest=data.addr))


    async def write_data_from_file(self, filepath):
        data_list = DataList.from_file(filepath, is_stream=True)
        await data_list.write_using(self)

    

    def start_run(self, file):
        return cocotb.start_soon(StimuliList.from_file(file, is_stream=True).run(self))
