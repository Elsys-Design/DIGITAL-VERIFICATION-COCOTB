import cocotbext.axi.axis
import cocotb
from cocotb.triggers import RisingEdge, Event, Combine, Timer



class AxiStreamSink(cocotbext.axi.axis.AxiStreamBase):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)

        self.current_accept = 0
        self.read_done = Event()


    async def read_data(self, data):
        self.current_accept = len(data.data)
        await self.read_done.wait()
        self.read_done.clear()


    async def _run(self):
        if not hasattr(self.bus, "tready"):
            return
        
        if not hasattr(self.bus, "tvalid"):
            self.bus.tready.value = 1
            return

        self.bus.tready.value = 0

        while True:
            await RisingEdge(self.clock)

            if self.current_accept > 0:
                self.bus.tready.value = 1

            if self.bus.tready.value and self.bus.tvalid.value:
                self.current_accept -= 1

                if self.current_accept == 0:
                    self.bus.tready.value = 0
                    self.read_done.set()


