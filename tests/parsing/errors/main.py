import sys
import os
import filecmp

from framework.data import Data
from framework.data_list import DataList
from framework.fill_strategy import FillStrategy



def test_data_file(filepath):
    e = None
    try:
        DataList.from_file(filepath, 0, FillStrategy.ZEROS)
    except Exception as ex:
        e = ex
    finally:
        assert e, "File {} was parsed without raising any exception".format(filepath)

def test_stimuli_file(filepath):
    e = None
    try:
        StimuliList.from_file(filepath)
    except Exception as ex:
        e = ex
    finally:
        assert e, "File {} was parsed without raising any exception".format(filepath)


print("Starting error parsing tests")

for subdir, dirs, files in os.walk("."):
    for file in files:
        filepath = os.path.join(subdir, file)
        if os.path.splitext(file)[1] == ".dat":
            test_data_file(filepath)
        elif os.path.splitext(file)[1] == ".json":
            test_stimuli_file(filepath)

print("Error parsing tests passed")



