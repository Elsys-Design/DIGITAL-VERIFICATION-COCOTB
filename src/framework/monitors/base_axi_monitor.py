from collections import deque
import copy
import cocotb
from cocotbext.axi.axil_channels import AxiLiteAWMonitor, AxiLiteWMonitor, AxiLiteBMonitor, AxiLiteARMonitor, AxiLiteRMonitor
from cocotb.triggers import RisingEdge
from cocotb.queue import Queue

from ..time import Time
from ..data import Data, DataFormat
from ..data_list import DataList
from ..stimuli import Stimuli, Access
from .analysis_port import AnalysisPort

from .stimuli_loggers.efficient import EfficientStimuliLogger


class BaseAxiMonitor:
    """
    """


    def __init__(self, name, bus, clock, reset, reset_active_level, subscribe_default_logger, bus_monitors):
        self.name = name

        # Building analisys ports
        self.write_analysis_port = AnalysisPort()
        self.read_analysis_port = AnalysisPort()
        self.analysis_port = AnalysisPort()

        if subscribe_default_logger:
            self.analysis_port.subscribe(EfficientStimuliLogger("stimlogs/" + self.name).recv)

        # Building channel monitors
        channels = {
            bus.write: ["aw", "w", "b"],
            bus.read: ["ar", "r"]
        }

        for write_read_bus, channel_list in channels.items():
            for channel in channel_list:
                # Building bus monitor
                bus_mon = bus_monitors[channel](getattr(write_read_bus, channel), clock, reset, reset_active_level)
                bus_mon.queue_occupancy_limit = 2
                # Setting it as attribute
                setattr(self, channel, bus_mon)


        # Helpers to avoid using hasattr() everywhere
        self.has_write_id =  hasattr(self.aw, "awid")
        self.has_read_id =  hasattr(self.ar, "arid")
        self.has_wid =  hasattr(self.w, "wid") # for AXI3 support

        # Contains channel transaction items
        # If there is no ids (AXI-Lite or AXI without id) these are just [deque()] so basically no overhead
        # This is the general solution for ids
        self.aw_queues = [deque() for _ in range(len(self.aw.awid) if self.has_write_id else 1)]
        self.w_queues = [deque() for _ in range(len(self.w.wid) if self.has_wid else 1)]
        self.write_start_time_queues = [deque() for _ in range(len(self.aw.awid) if self.has_write_id else 1)]

        self.ar_queues = [deque() for _ in range(len(self.ar.arid) if self.has_read_id else 1)]
        self.read_start_time_queues = [deque() for _ in range(len(self.ar.arid) if self.has_read_id else 1)]

        # Data sizes for write and read buses
        self.wsize = len(self.w.bus.wdata)//8
        self.rsize = len(self.r.bus.rdata)//8

        # Address size for write and read buses
        self.waddr_size = len(self.aw.bus.awaddr)//8
        self.raddr_size = len(self.ar.bus.araddr)//8
        
        # Ids for stimulis
        self.current_read_id = 0
        self.current_write_id = 0

        # Last end_time for rel_time computation
        self.last_write_start_time = Time(0, 'fs')
        self.last_read_start_time = Time(0, 'fs')


        # Starting all channel monitor tasks
        cocotb.start_soon(self.monitor_aw())
        cocotb.start_soon(self.monitor_w())
        cocotb.start_soon(self.monitor_b())
        cocotb.start_soon(self.monitor_ar())
        cocotb.start_soon(self.monitor_r())


    async def monitor_aw(self):
        while True:
            aw_t = await self.aw.recv()
            awid = aw_t.awid if self.has_write_id else 0
            self.aw_queues[awid].append(aw_t)
            current_time = Time.now()
            self.write_start_time_queues[awid].append((current_time, self.last_write_start_time))
            self.last_write_start_time = current_time

    async def monitor_w(self):
        while True:
            w_t = await self.w.recv()
            self.w_queues[w_t.wid if self.has_wid else 0].append(w_t)

    async def monitor_b(self):
        while True:
            b_t = await self.b.recv()
            # We have received a complete transaction, we can build the Stimuli
            self.build_write_stimuli(b_t)



    async def monitor_ar(self):
        while True:
            ar_t = await self.ar.recv()
            arid = ar_t.arid if self.has_read_id else 0
            self.ar_queues[arid].append(ar_t)
            current_time = Time.now()
            self.read_start_time_queues[arid].append((current_time, self.last_read_start_time))
            self.last_read_start_time = current_time

    async def monitor_r(self):
        while True:
            r_t = await self.r.recv()
            rid = r_t.rid if self.has_read_id else 0
            # We have received a complete transaction, we can build the Stimuli
            # (not true for AXI because there can be bursts, see override in AxiMonitor child class)
            self.build_read_stimuli(r_t)




    def _log_write_stimuli(self, data_obj, start_time, old_start_time, first_id = None, wstrb = 0):
        new_id = "{}_{}".format(self.name, self.current_write_id)
        if first_id == None:
            first_id = new_id
            desc = ""
        else:
            desc = "{} | wstrb = {}".format(first_id, wstrb)

        self.current_write_id += 1
        stim = Stimuli(
                new_id,
                Access.WRITE,
                start_time - old_start_time,
                DataList([data_obj]),
                desc,
                start_time,
                Time.now()
        )

        self.write_analysis_port.send(stim)
        self.analysis_port.send(stim)

        return first_id

    
    def build_write_stimuli(self, b_t):
        bid = b_t.bid if self.has_write_id else 0
        wid = bid if self.has_wid else 0

        aw_t = self.aw_queues[bid].popleft()
        start_time, old_start_time = self.write_start_time_queues[bid].popleft()

        awlen = aw_t.awlen if hasattr(aw_t, "awlen") else 0
        awsize = 2**aw_t.awsize if hasattr(aw_t, "awsize") else self.wsize

        # Support for wstrb
        current_addr = int(aw_t.awaddr)
        current_data = bytearray()
        for i in range(awlen+1):
            w_t = self.w_queues[wid].popleft()
            word = bytearray(int(w_t.wdata).to_bytes(awsize, "big"))
            if int(w_t.wstrb) == 2**awsize -1:
                # wstrb full
                current_data += word
            else:
                # First the enabled bytes that are still continuous to the transfert can be added 
                last_word_size = 0
                first_id = None
                while w_t.wstrb[-(1+last_word_size)] == 1:
                    last_word_size += 1

                if last_word_size > 0:
                    last_word = word[-last_word_size:]
                    current_data += last_word

                    data_obj = Data(current_addr, current_data, False, DataFormat(awsize, addr_size = self.waddr_size))
                    current_addr += len(current_data)
                    current_data = bytearray()

                    first_id = self._log_write_stimuli(data_obj, start_time, old_start_time, first_id, int(w_t.wstrb))

                # For any other enable byte, we log them as single byte stimulis
                for i in range(0, awsize-1-last_word_size):
                    current_addr += 1
                    if w_t.wstrb[i] == 1:
                        data_obj = Data(current_addr, bytearray(word[i]), False, DataFormat(1, addr_size
                                                                                            = self.waddr_size))
                        
                        first_id = self._log_write_stimuli(data_obj, start_time, old_start_time, first_id, int(w_t.wstrb))

        # If we only had full wstrb for the last bytes, we log them at the end
        if len(current_data) > 0:
            data_obj = Data(current_addr, current_data, False, DataFormat(awsize, addr_size = self.waddr_size))

            self._log_write_stimuli(data_obj, start_time, old_start_time)


    def build_read_stimuli(self, r_t):
        rid = r_t.rid if self.has_read_id else 0

        ar_t = self.ar_queues[rid].popleft()
        start_time, old_start_time = self.read_start_time_queues[rid].popleft()

        arlen = ar_t.arlen if hasattr(ar_t, "arlen") else 0
        arsize = 2**ar_t.arsize if hasattr(ar_t, "arsize") else self.rsize

        data = bytearray(int(r_t.rdata).to_bytes(self.rsize, "big"))
        
        for i in range(arlen):
            data += int(r_t.rdata).to_bytes(self.rsize, "big")

        # for unaligned address support
        #data = data[ar_t.araddr % self.rsize:]

        end_time = Time.now()

        data_obj = Data(int(ar_t.araddr), data, True, DataFormat(self.rsize, addr_size = self.raddr_size))
        
        new_id = "{}_{}".format(self.name, self.current_read_id)
        self.current_read_id += 1
        stim = Stimuli(
                new_id,
                Access.READ,
                # diff_or_zero if the difference is negative because of access pipelining
                start_time - old_start_time,
                DataList([data_obj]),
                "NOT IMPLEMENTED",
                start_time,
                end_time
        )

        self.read_analysis_port.send(stim)
        self.analysis_port.send(stim)

    # Defined in AxiMonitor subclass
    def write_burst_support(self, aw_t, wid):
        return []

    def read_burst_support(self, ar_t, rid):
        return []
