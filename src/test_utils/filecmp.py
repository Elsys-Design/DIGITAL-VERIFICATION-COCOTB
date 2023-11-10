import os
import filecmp

import cocotb


# force content compare instead of os.stat attributes only comparison
filecmp.cmpfiles.__defaults__ = (False,)


def has_differences(dcmp):
    differences = dcmp.left_only + dcmp.right_only + dcmp.diff_files
    if differences:
        return True
    return any([cmpdir(subdcmp) for subdcmp in dcmp.subdirs.values()])


def check_dirs_equal(dirpath0, dirpath1):
    assert has_differences(filecmp.dircmp(dirpath0, dirpath1)), \
                "Some files differ between {} and {} directories".format(dirname, golden_dirpath)


def compare_to_golden(dirname):
    golden_dirpath = os.path.join("golden_" + dirname, str(cocotb.RANDOM_SEED))

    assert os.path.isdir(golden_dirpath), \
            "{} is not a directory, seed {} not supported".format(golden_dirpath, cocotb.RANDOM_SEED)

    check_dirs_equal(dirname, golden_dirpath)
