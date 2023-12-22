import os
import filecmp
from pathlib import Path

from framework import DataList, StimuliList, FillStrategy


def _test_data_file(filepath, log):
    e = None
    try:
        DataList.from_file(filepath, 0, FillStrategy.ZEROS, is_stream=False)
    except Exception as ex:
        e = ex
        log.write("{0: <80} -- {1}\n".format(filepath, ex))
    finally:
        assert e, "File {} was parsed without raising any exception".format(filepath)


def _test_stimuli_file(filepath, log):
    e = None
    try:
        StimuliList.from_file(filepath, is_stream=False)
    except Exception as ex:
        e = ex
        log.write("{0: <80} -- {1}\n".format(filepath, ex))
    finally:
        assert e, "File {} was parsed without raising any exception".format(filepath)


def test_errors():
    print("Starting error parsing tests")

    log_file = open("log", "w")

    # Getting all test filepaths
    test_files = []
    for dirpath, dirnames, filenames in os.walk("."):
        for filename in filenames:
            test_files.append(os.path.join(dirpath, filename))
    # Sorting them since os.walk returns files in arbitrary orders
    test_files.sort()

    # Actual tests
    for filepath in test_files:
        suffix = Path(filepath).suffix
        if suffix == ".dat":
            _test_data_file(filepath, log_file)
        elif suffix == ".json":
            _test_stimuli_file(filepath, log_file)

    log_file.close()

    assert filecmp.cmp("log", "golden_log"), "log and golden_log are not the same"

    print("Error parsing tests passed")


if __name__ == "__main__":
    test_errors()
