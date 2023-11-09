import os
import random
from functools import partial
import filecmp

import cocotb
from cocotb.triggers import Combine, Timer
from cocotb.result import TestFailure

from framework.stimuli_list import StimuliList
from framework.data import Data, data_default_generator
from framework.data_list import DataList, datalist_default_generator

from tb import TB



# force content compare instead of os.stat attributes only comparison
filecmp.cmpfiles.__defaults__ = (False,)

def has_differences(dcmp):
    differences = dcmp.left_only + dcmp.right_only + dcmp.diff_files
    if differences:
        return True
    return any([has_differences(subdcmp) for subdcmp in dcmp.subdirs.values()])



@cocotb.test()
async def cocotb_run(dut):
    # Changing current directory to the one of the test
    os.chdir(os.path.abspath(os.path.dirname(__file__)))

    tb = TB(dut)
    await tb.reset()

    data_gen = partial(
            data_default_generator,
            min_addr = 0x44A00000,
            max_addr = 0x44A4FFFF,
            size_range = range(1, 0x10),
            word_size_range = range(1, 9),
            word_aligned = True
    )

    datalist_gen = partial(
            datalist_default_generator,
            data_gen,
            [2]
    )


    # Loading & executing scenarios
    tasks = []
    for i in range(2):
        data_list = datalist_gen()
        data_filepath = "generated_inputs/{}.dat".format(i)
        data_list.to_file(data_filepath)
        tasks.append(
                cocotb.start_soon(
                    tb.masters_in[i].write_data_from_file(data_filepath)
                )
        )

    # Letting the scenarios execute (passing simulation time)
    await Combine(*tasks)


    reference_dirpath = "references/{}".format(cocotb.RANDOM_SEED)

    assert os.path.isdir(reference_dirpath), "{} is not a directory, the seed doesn't allow for automatic testing since"\
                                                        "no reference to it exist".format(reference_dirpath)
    tb.write_monitor_data()

    assert not has_differences(filecmp.dircmp("stimlogs", reference_dirpath)), "Some files differ between stimlogs and reference directories"

    print("unit_write test passed")




