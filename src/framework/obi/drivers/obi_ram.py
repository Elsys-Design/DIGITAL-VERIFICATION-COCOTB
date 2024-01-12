import logging

import cocotbext.obi

from ...data_list import DataList
from ...data import Data
from ...utils import get_full_bus_name


class ObiRam(cocotbext.obi.ObiRam):
    """
    Wrapper that adds support for Data.

    Attributes:
        logger: Custom logger inheriting framework's logger but with the name of the bus.
    """

    def __init__(self, bus, clock, size=2**64):
        super().__init__(bus, clock, size)

        self.logger = logging.getLogger(f"framework.obi_ram({get_full_bus_name(bus)})")

    def write_data(self, data: Data) -> None:
        self.logger.info(
            "Writting Data(addr={}, length={})".format(data.addr, data.length)
        )
        self.write(data.addr, data.data)

    def read_data(self, data: Data) -> None:
        self.logger.info(
            "Reading Data(addr={}, length={})".format(data.addr, data.length)
        )
        data.data = self.read(data.addr, data.length)

    def write_datalist(self, data_list: DataList) -> None:
        for d in data_list:
            self.write_data(d)

    def write_data_from_file(self, filepath: str) -> None:
        self.write_datalist(DataList.from_file(filepath))

    def read_data_to_file(self, filepath: str, data: Data) -> None:
        if data.length <= 0:
            data.length = self.size
        self.read_data(data)
        DataList([data]).to_file(filepath)
