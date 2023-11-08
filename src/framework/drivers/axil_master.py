import cocotbext.axi



class AxiLiteMaster(cocotbext.axi.AxiLiteMaster):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)


    async def write_datalist(self, datalist):
        for data in datalist:
            await self.write_data(data)


    async def write_data(self, data):
        data.alignment_check()
        await self.write(data.addr, data.data)

    async def read_data(self, data):
        read_response = await self.read(data.addr, len(data.data))
        # Filling data but it's not used yet as we can log everything with the monitors
        data.data = read_response.data

