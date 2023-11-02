#!/bin/env python
import sys
import os
import filecmp

from framework.data import Data
from framework.data_list import DataList
from framework.fill_strategy import FillStrategy



def _test_data_file(filepath):
    e = None
    try:
        DataList.from_file(filepath, 0, FillStrategy.ZEROS)
    except Exception as ex:
        e = ex
    finally:
        assert e, "File {} was parsed without raising any exception".format(filepath)

def _test_stimuli_file(filepath):
    e = None
    try:
        StimuliList.from_file(filepath)
    except Exception as ex:
        e = ex
    finally:
        assert e, "File {} was parsed without raising any exception".format(filepath)


def test_errors():
    print("Starting error parsing tests")

    for subdir, dirs, files in os.walk("."):
        for file in files:
            filepath = os.path.join(subdir, file)
            if os.path.splitext(file)[1] == ".dat":
                _test_data_file(filepath)
            elif os.path.splitext(file)[1] == ".json":
                _test_stimuli_file(filepath)

    print("Error parsing tests passed")



if __name__ == "__main__":
    test_errors()
