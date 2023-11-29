from collections import deque
import os
import logging
from typing import List, Union, Dict, Type, Optional

import cocotb
from cocotb.triggers import RisingEdge
from cocotb.queue import Queue
import cocotbext.axi

from ..time import Time
from ..data import Data, DataFormat
from ..data_list import DataList
from ..stimuli import Stimuli, Access
from .analysis_port import AnalysisPort


class BaseAxiMonitor:
    """
    Base class for AxiMonitor and AxiLiteMonitor.
    It wraps all of cocotbext.axi channel monitors to generate Stimuli and Data objects.

    Attributes:
        name: Name of the monitor.
        logger: Custom logger, should inherit from the framework's logger.

        write_analysis_port: AnalysisPort to which all Write Stimulis are sent.
        read_analysis_port: AnalysisPort to which all Read Stimulis are sent.
        analysis_port: AnalysisPort to which all Stimulis are sent (Write and Read).

        default_stimuli_logger: Default StimuliLogger connected to the analysis_port.
            Instanciated only if the default_stimuli_logger_class is not None in the constructor.
    """


    def __init__(
            self,
            name: str,
            bus: Union[cocotbext.axi.AxiBus, cocotbext.axi.AxiLiteBus],
            clock, reset, reset_active_level,
            default_stimuli_logger_class: Type,
            bus_monitors : Dict[str, Type],
            logger: logging.Logger
    ) -> None:
        """
        Args:
            bus: The bus to monitor.
            default_stimuli_logger_class: If None, no default StimuliLogger is instancianted.
                If not None, a new StimuliLogger is instanciated with this class.
            bus_monitors: Dictionnary of the types of all bus monitors with their name (aw, w, b, ar, r) as keys.
                This allows to use either cocotbext.axi.AxiLite*Monitor or cocotbext.axi.Axi*Monitor classes.
        """
        self.name = name
        self.logger = logger

        # Building analysis ports
        self.write_analysis_port = AnalysisPort()
        self.read_analysis_port = AnalysisPort()
        self.analysis_port = AnalysisPort()

        # Building default logger
        self.default_stimuli_logger = None
        if default_stimuli_logger_class is not None:
            self.default_stimuli_logger = default_stimuli_logger_class(os.path.join("stimlogs/" + self.name))
            self.analysis_port.subscribe(self.default_stimuli_logger.write)

        # Building channel monitors
        # after this, self.aw is a cocotbext.axi.AxiAWMonitor (or AxiLiteAWMonitor),
        # self.w is a cocotbext.axi.AxiWMonitor, ...
        channels = {
            bus.write: ["aw", "w", "b"],
            bus.read: ["ar", "r"]
        }
        for write_read_bus, channel_list in channels.items():
            for channel in channel_list:
                # Building bus monitor
                bus_mon = bus_monitors[channel](getattr(write_read_bus, channel), clock, reset, reset_active_level)
                # Setting it as attribute
                setattr(self, channel, bus_mon)


        # Helpers to avoid using hasattr() everywhere
        self.has_write_id =  hasattr(self.aw.bus, "awid")
        self.has_read_id =  hasattr(self.ar.bus, "arid")
        self.has_wid =  hasattr(self.w.bus, "wid") # for AXI3 support

        # Queues to contain channel transaction items until the transaction ends so we can process them all at once
        # If there is no ids (AXI-Lite or AXI without id) these are just [deque()] so basically no overhead
        # -> this is a general solution for ids since Axi-Lite and Axi without id buses behave (id wise) like Axi buses
        #       with transactions ids being only 0.
        self.aw_queues = [deque() for _ in range(2**len(self.aw.bus.awid) if self.has_write_id else 1)]
        self.w_queues = [deque() for _ in range(2**len(self.w.bus.wid) if self.has_wid else 1)]
        self.write_start_time_queues = [deque() for _ in range(2**len(self.aw.bus.awid) if self.has_write_id else 1)]

        self.ar_queues = [deque() for _ in range(2**len(self.ar.bus.arid) if self.has_read_id else 1)]
        self.r_queues = [deque() for _ in range(2**len(self.r.bus.rid) if self.has_read_id else 1)]
        self.read_start_time_queues = [deque() for _ in range(2**len(self.ar.bus.arid) if self.has_read_id else 1)]

        # Data sizes for write and read buses
        self.wsize = len(self.w.bus.wdata)//8
        self.rsize = len(self.r.bus.rdata)//8

        # Address size for write and read buses
        self.waddr_size = len(self.aw.bus.awaddr)//8
        self.raddr_size = len(self.ar.bus.araddr)//8
        
        # Id counter for stimulis
        self.current_id = 0

        # Last end_time for rel_time computation
        self.last_write_start_time = Time(0, 'fs')
        self.last_read_start_time = Time(0, 'fs')


        # Starting all channel monitor tasks
        cocotb.start_soon(self.monitor_aw())
        cocotb.start_soon(self.monitor_w())
        cocotb.start_soon(self.monitor_b())
        cocotb.start_soon(self.monitor_ar())
        cocotb.start_soon(self.monitor_r())


    async def monitor_aw(self) -> None:
        """
        Monitors the aw channel.
        """
        while True:
            aw_t = await self.aw.recv()
            awid = int(aw_t.awid) if self.has_write_id else 0
            self.aw_queues[awid].append(aw_t)
            current_time = Time.now()
            self.write_start_time_queues[awid].append((current_time, self.last_write_start_time))
            self.last_write_start_time = current_time

    async def monitor_w(self) -> None:
        """
        Monitors the w channel.
        It has ids only in Axi3 (to test).
        In Axi4 it's in order with the aw channel:
            If an item on the aw channel has a length of 10, we know there is 10 items on the w channel that are/will be
            linked to it.
            /!\\ The items on the w channel can arrive BEFORE the corresponding item on the aw channel.
        """
        while True:
            w_t = await self.w.recv()
            self.w_queues[w_t.wid if self.has_wid else 0].append(w_t)

    async def monitor_b(self) -> None:
        """
        Monitors the b channel.
        This always means that a write transaction is over so we don't need a queue, we simply pass it to the
        build_write_stimuli method directly.
        """
        while True:
            b_t = await self.b.recv()
            # We have received a complete transaction, we can build the Stimuli
            self._build_write_stimuli(b_t)



    async def monitor_ar(self) -> None:
        """
        Monitors the ar channel.
        """
        while True:
            ar_t = await self.ar.recv()
            arid = int(ar_t.arid) if self.has_read_id else 0
            self.ar_queues[arid].append(ar_t)
            current_time = Time.now()
            self.read_start_time_queues[arid].append((current_time, self.last_read_start_time))
            self.last_read_start_time = current_time

    async def monitor_r(self) -> None:
        """
        Monitors the r channel.
        If there are no 'rlast' signal on the bus, it's an Axi-Lite bus
            -> we build the read stimuli directly (since there is no burst support)
        If there is an 'rlast' signal on the bus, it's an Axi bus
            -> we wait for rlast to be asserted to build the Stimuli.

        Possible ISSUE: an axi master may not have an rlast signal but an axi slave always does.
        This has never posed any problems on any tests but in theory if the bus is build from an axi master that has no
        'rlast' signal as input, we may consider an Axi bus as an AxiLite bus.
        FIX: check the last ar channel item's arlen.
        """
        while True:
            r_t = await self.r.recv()
            rid = int(r_t.rid) if self.has_read_id else 0
            self.r_queues[rid].append(r_t)

            if not hasattr(r_t, "rlast") or r_t.rlast:
                self._build_read_stimuli(rid)



    def _log_write_stimuli(
            self,
            data_obj: Data,
            start_time: Time,
            old_start_time: Time,
            first_id: Optional[str] = None,
            diff_awsize: Optional[int] = None,
            wstrb: Optional[int] = None
    ) -> str:
        """
        Private helper method used in build_write_stimuli.

        Args:
            data_obj: Data of the new Stimuli.
            first_id: allows to link multiple Stimuli objects by putting the id of the first Stimuli of the burst
                in the description of all other Stimulis of the same burst.
            diff_awsize: None if 2**awsize == bus data size else 2**awsize.
                This is given with the wstrb (so it's redundant) but it may allow to understand logs better.
            wstrb: None if wstrb full else wstrb.
                Allows to add the wstrb in the description of the Stimuli when it's not full.
        """
        # Building id and desc
        new_id = "{}_{}".format(self.name, self.current_id)
        self.current_id += 1
        if first_id == None:
            first_id = new_id
            desc = ""
        else:
            desc = first_id

        if wstrb is not None:
            if len(desc) > 0:
                desc += "| "
            desc += "wstrb = {}".format(wstrb)

        if diff_awsize is not None:
            if len(desc) > 0:
                desc += "| "
            desc += "awsize = {}".format(diff_awsize)
        
        # Building Stimuli
        stim = Stimuli(
                new_id,
                Access.WRITE,
                start_time - old_start_time,
                DataList([data_obj]),
                desc,
                start_time,
                Time.now()
        )

        # Logging write Stimuli
        self.write_analysis_port.send(stim)
        self.analysis_port.send(stim)

        self.logger.info("Logged " + stim.short_desc())

        return first_id

    
    def _build_write_stimuli(self, b_t: cocotbext.axi.axi_channels.AxiBTransaction) -> None:
        """
        Builds (and logs) a write Stimuli and the associated Data objects from:
        - aw_t = the last aw channel item for this id (= b_t.bid)
        - w_t(s) = the last aw_t.awlen+1 w channel items for this id (the ones linked to the aw_t item)
        - b_t = the last b channel item received

        Args:
            b_t: The last b channel item received.
                It's not passed through a queue like other channel items because when we receive it we know there is
                a transaction that is over so we can directly handle it.
        """
        # Getting the id of the finished transaction
        bid = int(b_t.bid) if self.has_write_id else 0
        # For Axi3 support
        wid = int(bid) if self.has_wid else 0

        # Getting the last aw channel item for this id
        aw_t = self.aw_queues[bid].popleft()

        start_time, old_start_time = self.write_start_time_queues[bid].popleft()

        awlen = int(aw_t.awlen) if hasattr(aw_t, "awlen") else 0
        
        diff_awsize = 2**int(aw_t.awsize) if hasattr(aw_t, "awsize") and 2**int(aw_t.awsize) != self.wsize else None

        # Support for wstrb
        current_addr = int(aw_t.awaddr)
        current_data = bytearray()
        first_id = None
        for i in range(awlen+1):
            w_t = self.w_queues[wid].popleft()
            word = bytearray(reversed(w_t.wdata.buff))

            if int(w_t.wstrb) == 2**self.wsize-1:
                # Full word
                current_data += word
            else:

                is_continuous = True
                if i == awlen:
                    # The enabled bytes that are still continuous to the transfert can be added since it's the end of
                    # a burst
                    last_word_size = 0
                    while w_t.wstrb[-(1+last_word_size)] == 1:
                        last_word_size += 1
                    
                    # Continuing to check wstrb to see if there isn't another 1 after the first 0
                    for x in range(last_word_size+1, self.wsize):
                        if w_t.wstrb[-x] == 1:
                            is_continuous = False
                    
                    if is_continuous and last_word_size > 0:
                        # Add the last incomplete word and log the stimuli
                        last_word = word[:last_word_size]
                        current_data += last_word

                        data_obj = Data(current_addr, current_data, False, DataFormat(self.wsize, addr_size = self.waddr_size))
                        current_addr += len(current_data)
                        current_data = bytearray()

                        first_id = self._log_write_stimuli(data_obj, start_time, old_start_time, first_id, diff_awsize)

                # We arrive here either because i != awlen or because i == awlen and the last word isn't continuous
                # (it's not an elif bus just a if)
                if i != awlen or not is_continuous:

                    if len(current_data) != 0:
                        # Logging the current_data that is continuous
                        data_obj = Data(current_addr, current_data, False, DataFormat(self.wsize, addr_size = self.waddr_size))
                        first_id = self._log_write_stimuli(data_obj, start_time, old_start_time, first_id, diff_awsize)
                        current_addr += len(current_data)
                        current_data = bytearray()

                    # Logging unitary Stimuli with non continuous wstrb
                    data_obj = Data(current_addr, word, False, DataFormat(self.wsize, addr_size = self.waddr_size))
                    first_id = self._log_write_stimuli(data_obj, start_time, old_start_time, first_id, diff_awsize, str(w_t.wstrb)[::-1])
                    # To handle addresses that are not aligned on the bus size
                    current_addr += self.wsize - (current_addr % self.wsize)

        # If we only had full wstrb for the last bytes, we log them at the end
        if len(current_data) > 0:
            data_obj = Data(current_addr, current_data, False, DataFormat(self.wsize, addr_size = self.waddr_size))

            self._log_write_stimuli(data_obj, start_time, old_start_time, first_id, diff_awsize)



    def _build_read_stimuli(self, rid: int) -> None:
        """
        Builds a read Stimuli and the associated Data objects from:
        - ar_t = the last ar channel item for this id (= rid)
        - r_t(s) = the last ar_t.arlen+1 r channel items for this id (the ones linked to the ar_t item)

        Args:
            rid: Read id of the read transaction that just ended to use the right queues.
        """
        # Getting the last ar channel item for this id
        ar_t = self.ar_queues[rid].popleft()

        start_time, old_start_time = self.read_start_time_queues[rid].popleft()

        arlen = int(ar_t.arlen) if hasattr(ar_t, "arlen") else 0
        
        diff_arsize = 2**int(ar_t.arsize) if hasattr(ar_t, "arsize") and 2**int(ar_t.arsize) != self.rsize else None

        # Concatenation of all r channel items' data
        data = bytearray()
        while len(self.r_queues[rid]) > 0:
            r_t = self.r_queues[rid].popleft()
            data += bytearray(reversed(r_t.rdata.buff))

        end_time = Time.now()

        # Building Data
        data_obj = Data(int(ar_t.araddr), data, True, DataFormat(self.rsize, addr_size = self.raddr_size))
        
        # Building Stimuli
        new_id = "{}_{}".format(self.name, self.current_id)
        self.current_id += 1
        stim = Stimuli(
                new_id,
                Access.READ,
                # diff_or_zero if the difference is negative because of access pipelining
                start_time - old_start_time,
                DataList([data_obj]),
                "arsize = {}".format(diff_arsize) if diff_arsize is not None else "",
                start_time,
                end_time
        )

        # Logging read Stimuli
        self.read_analysis_port.send(stim)
        self.analysis_port.send(stim)

        self.logger.info("Logged " + stim.short_desc())

