import cocotbext.axi
import cocotb
from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data



class AxiLiteMaster(cocotbext.axi.AxiLiteMaster):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)


    async def write_data(self, data):
        data.alignment_check()
        await self.write(data.addr, data.data)

    async def read_data(self, data):
        read_response = await self.read(data.addr, data.length)
        # Filling data but it's not used yet as we can log everything with the monitors
        data.data = read_response.data



    async def write_datalist(self, data_list):
        for d in data_list:
            await self.write_data(d)

    async def write_data_from_file(self, filepath):
        await self.write_datalist(DataList.from_file(filepath))


    async def read_datalist(self, data_list):
        for d in data_list:
            await self.read_data(d)

    async def read_data_to_file(self, filepath, address, length):
        d = Data(address, length)
        await self.read_data(d)
        DataList([d]).to_file(filepath)




    def start_run(self, file):
        return cocotb.start_soon(StimuliList.from_file(file, is_stream=False).run(self))

