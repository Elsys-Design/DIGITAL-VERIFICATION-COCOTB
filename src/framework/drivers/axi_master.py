import cocotbext.axi



class AxiMaster(cocotbext.axi.AxiMaster):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, max_burst_len=256, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, max_burst_len, **kwargs)


    async def write_data(self, data):
        data.alignment_check()
        await self.write(data.addr, data.data, awid = 0)


    async def read_data(self, data):
        read_response = await self.read(data.addr, len(data.data), arid = 0)
        # Filling data but it's not used yet as we can log everything with the monitors
        data.data = read_response.data
