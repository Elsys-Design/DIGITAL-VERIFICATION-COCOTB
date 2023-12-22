import cocotb
import os

from framework import Data

from test_utils.filecmp import check_dirs_equal

from tb import TB


@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    # Writting axilite_ram0, axilite_ram1 and axi_ram using data files in inputs/
    for i in range(2):
        tb.out_axilite_rams[i].write_data_from_file("inputs/lite_ram{}.dat".format(i))
    tb.out_axi_ram.write_data_from_file("inputs/ram.dat")

    # Reading the rams to a file in read_data/
    for i in range(2):
        tb.out_axilite_rams[i].read_data_to_file(
            "read_data/lite_ram{}.dat".format(i), Data.build_empty(0, 16)
        )
    tb.out_axi_ram.read_data_to_file("read_data/ram.dat", Data.build_empty(0x100, 8))

    # Comparing inputs/ and read_data/
    check_dirs_equal("inputs", "read_data")
