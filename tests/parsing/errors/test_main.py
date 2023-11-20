#!/bin/env python
import sys
import os
import filecmp

from framework.data import Data
from framework.data_list import DataList
from framework.stimuli_list import StimuliList
from framework.fill_strategy import FillStrategy



def _test_data_file(filepath, log):
    e = None
    try:
        DataList.from_file(filepath, 0, FillStrategy.ZEROS, is_stream = False)
    except Exception as ex:
        e = ex
        log.write("{0: <80} -- {1}\n".format(filepath, ex))
    finally:
        assert e, "File {} was parsed without raising any exception".format(filepath)

def _test_stimuli_file(filepath, log):
    e = None
    try:
        StimuliList.from_file(filepath, is_stream = False)
    except Exception as ex:
        e = ex
        log.write("{0: <80} -- {1}\n".format(filepath, ex))
    finally:
        assert e, "File {} was parsed without raising any exception".format(filepath)


def test_errors():
    print("Starting error parsing tests")

    log_file = open("log", "w")

    for subdir, dirs, files in os.walk("."):
        for file in files:
            filepath = os.path.join(subdir, file)
            if os.path.splitext(file)[1] == ".dat":
                _test_data_file(filepath, log_file)
            elif os.path.splitext(file)[1] == ".json":
                _test_stimuli_file(filepath, log_file)

    log_file.close()

    assert filecmp.cmp("log", "golden_log"), "log and golden_log are not the same"

    print("Error parsing tests passed")


if __name__ == "__main__":
    test_errors()
