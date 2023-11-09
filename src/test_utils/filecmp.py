import os
import filecmp

import cocotb


# force content compare instead of os.stat attributes only comparison
filecmp.cmpfiles.__defaults__ = (False,)

def cmpdir(dcmp):
    differences = dcmp.left_only + dcmp.right_only + dcmp.diff_files
    if differences:
        return True
    return any([cmpdir(subdcmp) for subdcmp in dcmp.subdirs.values()])


def compare_to_golden(dirname):
    golden_dirpath = os.path.join("golden_" + dirname, str(cocotb.RANDOM_SEED))

    assert os.path.isdir(golden_dirpath), \
            "{} is not a directory, seed {} not supported".format(golden_dirpath, cocotb.RANDOM_SEED)

    assert not cmpdir(filecmp.dircmp(dirname, golden_dirpath)), \
            "Some files differ between {} and {} directories".format(dirname, golden_dirpath)

