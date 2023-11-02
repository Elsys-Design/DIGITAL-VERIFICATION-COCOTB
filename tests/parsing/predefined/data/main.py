import sys
import os
import filecmp

from framework.data_list import DataList
from framework.fill_strategy import FillStrategy


res_filename = "res.dat"
tmp_filename = "tmp.dat"


print("Starting parsing tests")

for subdir, dirs, files in os.walk("."):
    if res_filename in files:
        res_path = os.path.join(subdir, res_filename)
        files.remove(res_filename)
        for file in files:
            file_path = os.path.join(subdir, file)
            print("Testing {}".format(file_path))
            datalist = DataList.from_file(file_path, 0, FillStrategy.ZEROS)
            datalist.to_file(tmp_filename)
            assert filecmp.cmp(res_path, tmp_filename), \
                    "Parsed & printed {} isn't conform to the associated res.dat, printed file is {}".format(file_path, tmp_filename)


os.remove(tmp_filename)
print("Parsing tests passed")

