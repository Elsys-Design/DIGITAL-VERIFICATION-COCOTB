import os
import filecmp

from framework.data_list import DataList, FillStrategy


res_filename = "res.dat"
tmp_filepath = "tmp.dat"


def test_data():
    print("Starting parsing tests")

    for subdir, dirs, files in os.walk("."):
        if res_filename in files:
            res_path = os.path.join(subdir, res_filename)
            files.remove(res_filename)
            for file in files:
                filepath = os.path.join(subdir, file)
                print("Testing {}".format(filepath))
                datalist = DataList.from_file(filepath, 0, FillStrategy.ZEROS)
                datalist.to_file(tmp_filepath, addr_to_zero=False)
                assert filecmp.cmp(
                    res_path, tmp_filepath
                ), "Parsed & printed {} isn't conform to the associated res.dat, printed file is {}".format(
                    filepath, tmp_filepath
                )

    os.remove(tmp_filepath)
    print("Parsing tests passed")


if __name__ == "__main__":
    test_data()
