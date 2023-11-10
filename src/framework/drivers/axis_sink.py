import cocotbext.axi.axis
import cocotb
from cocotb.triggers import RisingEdge, Event, Combine, Timer
from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data
from ..logger import logger



class AxiStreamSink(cocotbext.axi.axis.AxiStreamBase):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)

        self.current_idx = 0
        self.current_data = None
        self.read_done = Event()

        self.bus_tdest_size = len(self.bus.tdest.value) // 8 if hasattr(self.bus, "tdest") else 1
        self.bus_data_size = len(self.bus.tdata.value) // 8

    async def read_data(self, data):
        self.current_idx = 0
        self.current_data = data
        self.current_data.dformat.addr_size = self.bus_tdest_size
        self.current_data.dformat.word_size = self.bus_data_size
        await self.read_done.wait()
        self.read_done.clear()

    
    async def read_data_to_file(self, filepath, length):
        if length == 0:
            return
        d = Data(0x0, bytearray([0]*length))
        await self.read_data(d)
        DataList([d]).to_file(filepath)



    def start_run(self, file):
        # is_stream doesn't do anything here since parsing Data is what differs
        # We could eventually accept stimulis without an Address field here since it's not used anyways
        return cocotb.start_soon(StimuliList.from_file(file, is_stream=True).run(self))


    async def _run(self):
        if not hasattr(self.bus, "tready"):
            return NotImplementedError("Bus has no tready")
        
        if not hasattr(self.bus, "tvalid"):
            return NotImplementedError("Bus has no tvalid")

        bus_size = len(self.bus.tdata)//8
        has_tkeep = hasattr(self.bus, "tkeep")

        self.bus.tready.value = 0

        while True:
            await RisingEdge(self.clock)

            if self.current_data:
                self.bus.tready.value = 1

            if self.bus.tready.value and self.bus.tvalid.value:
                if hasattr(self.bus, "tdest"):
                    tdest = int(self.bus.tdest.value)

                    # If multiple tdest arrive to the same sink
                    if self.current_idx == 0:
                        self.current_data.addr = tdest
                    elif self.current_data.addr != tdest:
                        logger.warning("While reading an AXI-Stream data of size {}, the tdest changed at byte {}" \
                                .format(len(self.current_data.data), self.current_idx))

                if has_tkeep:
                    for i in range(len(self.bus.tkeep.value)):
                        if self.bus.tkeep.value[i]:
                            self.current_data.data[self.current_idx] = self.bus.tdata.value.buff[-(1+i)]
                            self.current_idx += 1
                else:
                    self.current_data.data[self.current_idx:self.current_idx+bus_size] = reversed(self.bus.tdata.value.buff)
                    self.current_idx += bus_size
                
                # if the bus has no tkeep, we can receive more bytes than we want and there's nothing we can do about it
                if self.current_idx >= len(self.current_data.data):
                    self.bus.tready.value = 0
                    self.current_idx = 0
                    self.current_data = None
                    self.read_done.set()


