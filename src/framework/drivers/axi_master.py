import cocotbext.axi
import cocotb
import logging

from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data



class AxiMaster(cocotbext.axi.AxiMaster):
    """
    Wrapper that adds support for Data.
    """

    def __init__(self, bus, clock, reset=None, reset_active_level=True, max_burst_len=256, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, max_burst_len, **kwargs)
        
        self.logger = logging.getLogger("framework.axi_master." + bus.write.aw._name)


    async def write_data(self, data):
        self.logger.info("Writting Data(addr={}, length={})".format(data.addr, data.length))
        data.alignment_check()
        await self.write(data.addr, data.data, awid = 0)

    async def read_data(self, data):
        self.logger.info("Reading Data(addr={}, length={})".format(data.addr, data.length))
        read_response = await self.read(data.addr, data.length, arid = 0)
        # Filling data but it's not used yet as we can log everything with the monitors
        data.data = bytearray(read_response.data)



    async def write_datalist(self, data_list):
        for d in data_list:
            await self.write_data(d)

    async def write_data_from_file(self, filepath):
        await self.write_datalist(DataList.from_file(filepath))


    async def read_datalist(self, data_list):
        for d in data_list:
            await self.read_data(d)

    async def read_data_to_file(self, filepath, data):
        await self.read_data(data)
        DataList([data]).to_file(filepath)




    def start_run(self, file):
        """
        Helper method to run a StimuliList on a master directly from file.
        """
        stim_list = StimuliList.from_file(file, is_stream=False)
        self.logger.info("Starting run with {}".format(stim_list.name))
        return cocotb.start_soon(stim_list.run(self))

