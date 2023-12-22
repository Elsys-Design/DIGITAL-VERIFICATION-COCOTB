import cocotbext.axi.axis
import cocotb
from cocotb.triggers import RisingEdge, Event
import logging
from typing import Union

from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data, DataFormat


class AxiStreamSink(cocotbext.axi.axis.AxiStreamBase):
    """
    Adds support for Data and for reads of fixed size (and not just until the tlast).
    This is a custom AxiStreamSink that doesn't inherit cocotbext.axi.AxiStreamSink but cocotbext.axi.AxiStreamSink's
    parent class directly.

    Attributes:
        logger: Custom logger inheriting framework's logger but with the name of the bus.
    """

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs):
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)

        self.read_start = Event()
        self.read_done = Event()

        self.bus_tdest_size = (
            len(self.bus.tdest.value) // 8 if hasattr(self.bus, "tdest") else 1
        )
        self.bus_data_size = len(self.bus.tdata.value) // 8

        self.logger = logging.getLogger("framework.axis_sink." + bus._name)

    async def read_data(self, length: Union[int, Data]) -> DataList:
        """
        Reads 'data' to the bus and wait until the read is over.

        Args:
            length: Either the length of the read directly or a Data object with the right length.

        Returns:
            A DataList containing all the data read (a new Data is created for every tlast).
        """
        if isinstance(length, Data):
            length = length.length

        self.logger.info("Reading Data(length={})".format(length))

        if length <= 0:
            raise ValueError("Read of size {} <= 0".format(length))
        self.data_list = DataList()
        self.read_start.set(length)
        await self.read_done.wait()
        self.read_done.clear()
        return self.read_done.data

    async def read_word(self, length: int) -> int:
        """
        Helper that directly converts the data to an int.

        Args:
            length: The length of the data. Shouldn't be over the bus' data size.

        Returns:
            An int representing the data received.
        """
        data_list = await self.read_data(length)
        data = data_list.full_bytearray()
        return int(data.hex(), 16)

    async def read_data_to_file(self, filepath: str, length: int) -> None:
        data_list = await self.read_data(length)
        data_list.to_file(filepath)

    async def write_data(self, data):
        raise NotImplementedError("write_data isn't supported for AxiStreamSink.")

    def init_run(self, file: str) -> cocotb.triggers.Task:
        """
        Helper method to run a StimuliList on a master directly from file.

        Args:
            file: Path of the stimuli file to run on this driver.

        Returns:
            The new cocotb Task.
        """
        # is_stream doesn't do anything here since parsing Data is what differs and this is only READ Accesses
        # (so there's no data to parse).
        stim_list = StimuliList.from_file(file, is_stream=True)
        self.logger.info("Starting run with {}".format(stim_list.name))
        return cocotb.start_soon(stim_list.run(self))

    async def _run(self) -> None:
        if not hasattr(self.bus, "tready"):
            return NotImplementedError("Bus has no tready")

        if not hasattr(self.bus, "tvalid"):
            return NotImplementedError("Bus has no tvalid")

        has_tkeep = hasattr(self.bus, "tkeep")
        has_tdest = hasattr(self.bus, "tdest")
        has_tlast = hasattr(self.bus, "tlast")

        self.bus.tready.value = 0

        def new_current_data():
            dformat = DataFormat(
                word_size=self.bus_data_size, addr_size=self.bus_tdest_size
            )
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
                            if self.bus.tkeep.value[-(1 + i)]:
                                current_data.data.append(
                                    self.bus.tdata.value.buff[-(1 + i)]
                                )
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
                        self.read_done.set(data=data_list)
