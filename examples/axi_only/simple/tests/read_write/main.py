import os

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, Combine

# if using real time logger instead of efficient logger
from framework import AxiBus, AxiMaster, AxiMonitor, RealTimeStimuliLogger


@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    # Building the clock
    clock_sig = Clock(dut.aclk_0, 10, units="ns")
    cocotb.start_soon(clock_sig.start(start_high=False))

    # init reset
    dut.aresetn_0.value = 0
    await Timer(123, units="ns")
    dut.aresetn_0.value = 1

    # create bus axi
    bus_in = AxiBus.from_prefix(dut, "S00_AXI_0")

    # create master axi
    master_in = AxiMaster(bus_in, dut.aclk_0, dut.aresetn_0, reset_active_level=False)

    # create efficient monitor
    # monitor_in=AxiMonitor("S00_AXI_0",bus_in,dut.aclk_0, dut.aresetn_0,reset_active_level=False )

    # or create real time logger
    monitor_in = AxiMonitor(  # noqa: F841
        bus_in,
        dut.aclk_0,
        dut.aresetn_0,
        reset_active_level=False,
        default_stimuli_logger_class=RealTimeStimuliLogger,
    )

    # prepare testbench
    tasks = []
    tasks.append(master_in.init_run("inputs/stimulis0.json"))

    # testbench stimuli
    # force ack on ipic

    dut.IPIC_0_data_rd.value = 0x12345678
    dut.IPIC_0_error.value = 0
    dut.IPIC_0_ack.value = 0

    # wait for read command
    await RisingEdge(dut.IPIC_0_req)
    # set ack on wr
    dut.IPIC_0_ack.value = 1
    await FallingEdge(dut.IPIC_0_req)
    dut.IPIC_0_ack.value = 0

    # set ack on read
    await RisingEdge(dut.IPIC_0_req)
    dut.IPIC_0_ack.value = 1
    await FallingEdge(dut.IPIC_0_req)
    dut.IPIC_0_ack.value = 0

    # Letting the scenarios execute
    await Combine(*tasks)

    # Waiting for the VHDL to finish
    await Timer(10, units="ns")

    # Writing the stimulis and data logged by monitors (uses the monitors' default logger)
    # use it only for efficient logger
    # monitor_in.default_stimuli_logger.write_to_dir()
