import cocotbext.axi



class AxiStreamSource(cocotbext.axi.AxiStreamSource):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)


    async def write_data(self, data):
        await self.write(cocotbext.axi.AxiStreamFrame(tdata=data.data, tdest=data.addr))

