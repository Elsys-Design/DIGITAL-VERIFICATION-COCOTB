import cocotbext.axi
import cocotb
from ..stimuli_list import StimuliList
from ..data_list import DataList
from ..data import Data



class AxiRam(cocotbext.axi.AxiRam):

    def __init__(self, bus, clock, reset=None, reset_active_level=True, size=2**64, mem=None, **kwargs):
        super().__init__(bus, clock, reset, reset_active_level, size, mem, **kwargs)


    def write_data(self, data):
        self.write(data.addr, data.data)

    def read_data(self, addr, length):
        return Data(
                addr,
                self.read(addr, length)
        )

    
