import cocotbext.axi
import cocotb
from ..stimuli_list import StimuliList



class AxiStreamSource(cocotbext.axi.AxiStreamSource):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)

    async def write_data(self, data):
        print(data)
        await self.write(cocotbext.axi.AxiStreamFrame(tdata=data.data, tdest=data.addr))

    def start_run(self, file):
        return cocotb.start_soon(StimuliList.from_file(file, is_stream=True).run(self))
