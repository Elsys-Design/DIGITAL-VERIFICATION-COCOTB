import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Combine, Timer
from cocotb.result import TestFailure
import os

from framework import Data
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotbext.axi import AxiLiteBus, AxiBus

from framework import   AxiMaster, AxiLiteMaster, AxiRam, AxiLiteRam, \
                        AxiMonitor, AxiLiteMonitor, \
                        Data
from test_utils.filecmp import check_dirs_equal
from cocotb.clock import Clock
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine


@cocotb.test()
async def cocotb_run(dut):

    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    # Building the clock
    clock_sig= Clock(dut.aclk_0, 10, units="ns")
    cocotb.start_soon(clock_sig.start(start_high=False))

    #init reset
    dut.aresetn_0.value = 0
    await Timer(123, units="ns")
    dut.aresetn_0.value = 1


    #create bus axi light
    bus_in= AxiLiteBus.from_prefix(dut, "S00_AXI_0")

    #create master axilight
    master_in=AxiLiteMaster(bus_in,dut.aclk_0, dut.aresetn_0,  reset_active_level=False)

    #create monitor
    monitor_in=AxiLiteMonitor("S00_AXI_0",bus_in,dut.aclk_0, dut.aresetn_0,reset_active_level=False )
    #write data logged to its respected folder
    monitor_in.default_stimuli_logger.write_to_dir()
    
    #prepare testbench
    tasks = []
    tasks.append(master_in.init_run("inputs/stimulis0.json"))    

    #testbench stimuli
    #force ack on ipic
    
    dut.IPIC_0_data_rd.value = 0x12345678
    dut.IPIC_0_error.value=0
    dut.IPIC_0_ack.value = 0

    #wait for read command
    await RisingEdge(dut.IPIC_0_req)
    #set ack on wr
    dut.IPIC_0_ack.value = 1
    await FallingEdge(dut.IPIC_0_req)
    dut.IPIC_0_ack.value = 0
    
    #set ack on read
    await RisingEdge(dut.IPIC_0_req)
    dut.IPIC_0_ack.value = 1
    await FallingEdge(dut.IPIC_0_req)
    dut.IPIC_0_ack.value = 0

    # Letting the scenarios execute (passing simulation time)
    await Combine(*tasks)

    # Waiting for the VHDL to finish
    await Timer(10, units="ns")

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    tb.write_monitor_data()
