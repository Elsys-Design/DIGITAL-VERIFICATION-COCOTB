import cocotbext.axi.axis
import cocotb
from cocotb.triggers import RisingEdge, Event, Combine, Timer
from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data



class AxiStreamSink(cocotbext.axi.axis.AxiStreamBase):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)

        self.current_idx = 0
        self.current_data = None
        self.read_done = Event()

    async def read_data(self, data):
        self.current_idx = 0
        self.current_data = data
        await self.read_done.wait()
        self.read_done.clear()

    
    async def read_data_to_file(self, filepath, address, length):
        d = Data(address, bytearray([0]*length))
        await self.read_data(d)
        DataList([d]).to_file(filepath)



    def start_run(self, file):
        # is_stream doesn't do anything here since parsing Data is what differs
        # We could eventually accept stimulis without an Address field here since it's not used anyways
        return cocotb.start_soon(StimuliList.from_file(file, is_stream=True).run(self))


    async def _run(self):
        if not hasattr(self.bus, "tready"):
            return
        
        if not hasattr(self.bus, "tvalid"):
            self.bus.tready.value = 1
            return

        bus_size = len(self.bus.tdata)//8
        has_tkeep = hasattr(self.bus, "tkeep")

        self.bus.tready.value = 0

        while True:
            await RisingEdge(self.clock)

            if self.current_data:
                self.bus.tready.value = 1

            if self.bus.tready.value and self.bus.tvalid.value:
                if has_tkeep:
                    for i in range(len(self.bus.tkeep.value)):
                        if self.bus.tkeep.value[i]:
                            self.current_data.data[self.current_idx] = self.bus.tdata.value.buff[i]
                            self.current_idx += 1
                else:
                    self.current_data.data[self.current_idx:self.current_idx+bus_size] = self.bus.tdata.value.buff
                    self.current_idx += bus_size
                
                # if the bus has no tkeep, we can receive more bytes than we want and there's nothing we can do about it
                if self.current_idx >= len(self.current_data.data):
                    self.bus.tready.value = 0
                    self.current_idx = 0
                    self.current_data = None
                    self.read_done.set()


