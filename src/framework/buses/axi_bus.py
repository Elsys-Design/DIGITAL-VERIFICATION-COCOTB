
from cocotb.handle import ModifiableObject
from cocotb.binary import BinaryValue
import cocotbext.axi


class FixHandle:
    """
    Used to replace a ModifiableObject for a signal that doesn't exist.
    The difference is that this object doesn't try to propagate modifications to the simulator
    since that would cause an error.
    """
    def __init__(self, value):
        self.value = value

    def setimmediatevalue(self, value):
        self.value = value
    
    def __len__(self):
        return len(self.value)


class AxiBus(cocotbext.axi.AxiBus):
    """
    AxiBus replacement that adds id signals if they are not present.

    Note: Fixing length checking (for AXI3 awlen & awprot) is more complex because it means modifying objects that are
    used with the simulator.
    A patch to cocotbext.axi should be used for that purpose.
    """

    def __init__(self, write=None, read=None, **kwargs):
        super().__init__(write, read)


        def add_id_signal(bus, attr):
            if getattr(bus, attr, None) is None:
                fix_signal = FixHandle(BinaryValue(0))
                setattr(bus, attr, fix_signal)
                bus._signals[attr] = fix_signal

        add_id_signal(self.write.aw, "awid")
        add_id_signal(self.write.b, "bid")
        add_id_signal(self.read.ar, "arid")
        add_id_signal(self.read.r, "rid")

