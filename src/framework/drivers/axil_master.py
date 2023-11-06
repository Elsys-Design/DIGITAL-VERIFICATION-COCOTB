import cocotbext.axi



class AxiLiteMaster(cocotbext.axi.AxiLiteMaster):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)


    async def write_data(self, data):
        data.alignment_check()
        await self.write(data.addr, data.data)

    async def read_data(self, data):
        read_response = await self.read(data.addr, len(data.data))
        data.data = read_response.data

