import cocotbext.axi
import cocotb
from cocotb.queue import Queue
from cocotb.triggers import RisingEdge, Event
import logging

from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data



class AxiStreamSource(cocotbext.axi.AxiStreamSource):
    """
    Wrapper that adds support for Data.
    Also adds support for transaction without tlast at the end.

    Attributes:
        logger: Custom logger inheriting framework's logger but with the name of the bus.
    """

    def __init__(self, bus, clock, reset=None, reset_active_level=True, **kwargs): 
        super().__init__(bus, clock, reset, reset_active_level, **kwargs)

        self.bus_size = len(self.bus.tdata.value) // 8

        self.has_tkeep = hasattr(self.bus, "tkeep")
        self.has_tlast = hasattr(self.bus, "tlast")
        self.bus_data_size = len(self.bus.tdata.value) // 8
        
        self.logger = logging.getLogger("framework.axis_source." + bus._name)

    async def write_data(self, data: Data) -> None:
        """
        Writes 'data' to the bus and wait until the write is over.
        """
        # Just a warning in case there is no tkeep but the data doesn't fit exactly in the bus
        if not self.has_tkeep and data.length % self.bus_size  != 0:
            self.logger.warning(
                    "Writing data of size {} to AxiStream bus of size {} with no tkeep -> {} * 0x0 bytes will be " \
                    "added to the end of the transaction".format(data.length, self.bus_size, data.length%self.bus_size)
            )

        if self.has_tlast and not data.ends_with_tlast:
            cocotb.start_soon(self._remove_one_tlast())
        
        self.logger.info("Writting Data(tdest={}, length={})".format(data.addr, data.length))

        # tkeep is supported by default by cocotbext.axi.AxiStreamSource
        await self.write_frame(cocotbext.axi.AxiStreamFrame(tdata=data.data, tdest=data.addr))
        # For AxiStreamSource, awaiting the write() isn't enough (it just puts it in a queue)
        # We need to explicitly call wait()
        await self.wait()


    async def write_frame(self, frame: cocotbext.axi.AxiStreamFrame) -> None:
        """
        Gives access to cocotb's AxiStreamSource.write.
        """
        await super().write(frame)

    async def write_datalist(self, data_list: DataList) -> None:
        for d in data_list:
            await self.write_data(d)

    async def write_data_from_file(self, filepath: str) -> None:
        await self.write_datalist(DataList.from_file(filepath, is_stream=True))


    async def read_data(self, data):
        raise NotImplementedError("read_data isn't supported for AxiStreamSource.")


    

    def init_run(self, file: str) -> None:
        """
        Helper method to run a StimuliList on a master directly from file.
        /!\\ is_stream = True is important for the parsing.

        Args:
            file: Path of the stimuli file to run on this driver.

        Returns:
            The new cocotb Task.
        """
        stim_list = StimuliList.from_file(file, is_stream = True)
        self.logger.info("Starting run with {}".format(stim_list.name))
        return cocotb.start_soon(stim_list.run(self))



    async def _remove_one_tlast(self) -> None:
        """
        Removes the next tlast (passes it back from 1 to zero in no simulation time).
        """
        await RisingEdge(self.bus.tlast)
        self.logger.info("Removing a tlast")
        self.bus.tlast.value = 0
        return
