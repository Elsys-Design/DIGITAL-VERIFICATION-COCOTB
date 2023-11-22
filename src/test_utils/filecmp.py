import os
import subprocess

import cocotb


def is_same(dirpath0, dirpath1):
    ret = os.system("diff -rZ {} {} 2>&1 > /dev/null".format(dirpath0, dirpath1))
    return ret == 0


def check_dirs_equal(dirpath0, dirpath1):
    assert is_same(dirpath0, dirpath1), \
                "Some files differ between {} and {} directories".format(dirpath0, dirpath1)


def compare_to_golden(dirname):
    golden_dirpath = os.path.join("golden_" + dirname, str(cocotb.RANDOM_SEED))

    assert os.path.isdir(golden_dirpath), \
            "{} is not a directory, seed {} not supported".format(golden_dirpath, cocotb.RANDOM_SEED)

    check_dirs_equal(dirname, golden_dirpath)
