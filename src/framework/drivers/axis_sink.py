import cocotbext.axi.axis
import cocotb
from cocotb.triggers import RisingEdge, Event, Combine, Timer
from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data, DataFormat
from ..logger import logger



class AxiStreamSink(cocotbext.axi.axis.AxiStreamBase):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)

        self.read_start = Event()
        self.read_done = Event()

        self.bus_tdest_size = len(self.bus.tdest.value) // 8 if hasattr(self.bus, "tdest") else 1
        self.bus_data_size = len(self.bus.tdata.value) // 8

    async def read_data(self, length):
        if isinstance(length, Data):
            length = len(length.data)

        if length <= 0:
            raise ValueError("Read of size {} <= 0".format(length))
        self.data_list = DataList()
        self.read_start.set(length)
        await self.read_done.wait()
        self.read_done.clear()
        return self.read_done.data

    async def read_word(self, length : int):
        """
        Helper that directly converts the data to an int.
        To use only for small accesses
        """
        data_list = await self.read_data(length)
        data = data_list.full_bytearray()
        return int(data.hex(), 16)


    async def read_data_to_file(self, filepath, length):
        data_list = await self.read_data(length)
        data_list.to_file(filepath)


    def start_run(self, file):
        # is_stream doesn't do anything here since parsing Data is what differs
        # We could eventually accept stimulis without an Address field here since it's not used anyways
        return cocotb.start_soon(StimuliList.from_file(file, is_stream=True).run(self))


    async def _run(self):
        if not hasattr(self.bus, "tready"):
            return NotImplementedError("Bus has no tready")
        
        if not hasattr(self.bus, "tvalid"):
            return NotImplementedError("Bus has no tvalid")

        has_tkeep = hasattr(self.bus, "tkeep")
        has_tdest = hasattr(self.bus, "tdest")
        has_tlast = hasattr(self.bus, "tlast")

        self.bus.tready.value = 0

        def new_current_data():
            dformat = DataFormat(word_size = self.bus_data_size, addr_size = self.bus_tdest_size)
            return Data(0, bytearray(), False, dformat)

        while True:
            await self.read_start.wait()
            length = self.read_start.data
            self.read_start.clear()

            current_data = new_current_data()
            current_idx = 0
            data_list = DataList()

            while current_idx < length:
                await RisingEdge(self.clock)

                self.bus.tready.value = 1

                if self.bus.tready.value and self.bus.tvalid.value:
                    if has_tdest:
                        tdest = int(self.bus.tdest.value)
                        current_data.addr = tdest

                    if has_tkeep:
                        for i in range(len(self.bus.tkeep.value)):
                            if self.bus.tkeep.value[-(1+i)]:
                                current_data.data.append(self.bus.tdata.value.buff[-(1+i)])
                                current_idx += 1
                            if current_idx == length:
                                break
                    else:
                        toadd = min(self.bus_data_size, length - len(current_data.data))
                        received_word = bytearray(self.bus.tdata.value.buff)
                        received_word.reverse()
                        current_data.data += received_word[:toadd]
                        current_idx += toadd


                    if has_tlast:
                        if int(self.bus.tlast.value) == 1:
                            current_data.ends_with_tlast = True
                            data_list.append(current_data)
                            current_data = new_current_data()
                    

                    if current_idx == length:
                        self.bus.tready.value = 0
                        if len(current_data.data) > 0:
                            data_list.append(current_data)
                        self.read_done.set(data = data_list)


