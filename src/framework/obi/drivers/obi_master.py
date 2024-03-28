import cocotb
import logging

import cocotbext.obi

from ...stimuli_list import StimuliList
from ...data_list import DataList
from ...data import Data
from ...utils import get_full_bus_name


class ObiMaster(cocotbext.obi.ObiMaster):
    """
    Wrapper that adds support for Data.

    Attributes:
        logger: Custom logger inheriting framework's logger but with the name of the bus.
    """

    def __init__(self, bus, clock):
        super().__init__(bus, clock)

        self.logger = logging.getLogger(
            f"framework.obi_master({get_full_bus_name(bus)})"
        )

    async def write_data(self, data: Data) -> None:
        self.logger.info(
            "Writting Data(addr={}, value={})".format(data.addr, data.data)
        )
        data.alignment_check()
        await self.write(data.addr, data.data)

    async def read_data(self, data: Data) -> None:
        self.logger.info(
            "Reading Data(addr={}, length={})".format(data.addr, data.length)
        )
        data.data = await self.read(data.addr, data.length)

    async def atomic_write_data(self, data: Data):
        self.logger.info(
            "Writting Data(addr={}, value={}) atomically".format(data.addr, data.data)
        )
        data.alignment_check()
        # returning what was read because some processors use it (neorv32)
        data.data = (
            await self.exec(addr=data.addr, we=True, wdata=data.data, atomic_op=3)
        ).buff

    async def atomic_read_data(self, data: Data):
        self.logger.info(
            "Reading Data(addr={}, length={}) atomically".format(data.addr, data.length)
        )
        data.data = (await self.exec(addr=data.addr, we=False, atomic_op=2)).buff

    async def write_datalist(self, data_list: DataList) -> None:
        for d in data_list:
            await self.write_data(d)

    async def write_data_from_file(self, filepath: str) -> None:
        await self.write_datalist(DataList.from_file(filepath))

    async def read_datalist(self, data_list: DataList) -> None:
        for d in data_list:
            await self.read_data(d)

    async def read_data_to_file(self, filepath: str, data: Data) -> None:
        await self.read_data(data)
        DataList([data]).to_file(filepath)

    def init_run(self, file: str) -> cocotb.triggers.Task:
        """
        Helper method to run a StimuliList on a master directly from file.

        Args:
            file: Path of the stimuli file to run on this driver.

        Returns:
            The new cocotb Task.
        """
        stim_list = StimuliList.from_file(file, is_stream=False)
        self.logger.info("Starting run with {}".format(stim_list.name))
        return cocotb.start_soon(stim_list.run(self))
