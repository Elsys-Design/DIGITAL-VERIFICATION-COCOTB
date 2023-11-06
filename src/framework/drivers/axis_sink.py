import cocotbext.axi



class AxiStreamSink(cocotbext.axi.AxiStreamSink):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)


    async def read_data(self, data):
        """
        TODO: pause the sink until we read_data
        Don't accept frames but a certain number of bytes
        """
        frame = await self.recv()
        data.data[:] = frame.tdata

