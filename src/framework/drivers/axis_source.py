import cocotbext.axi



class AxiStreamSource(cocotbext.axi.AxiStreamSource):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)


    async def write_datalist(self, datalist):
        for i in range(len(datalist)):
            if datalist[i].is_linked_to_previous:
                # Here we know this data list is used on an AxiStream bus
                # tdest doesn't change
                datalist[i].addr = datalist[i-1].addr
            await self.write_data(datalist[i])

    async def write_data(self, data):
        print(data)
        await self.write(cocotbext.axi.AxiStreamFrame(tdata=data.data, tdest=data.addr))

