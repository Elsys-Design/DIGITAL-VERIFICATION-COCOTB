import sys
from framework.data_list import DataList
from framework.fill_strategy import FillStrategy


if len(sys.argv) != 3:
    raise ValueError("Args: data_file_path fill_strategy")

datalist = DataList.from_file(sys.argv[1], 0, FillStrategy(int(sys.argv[2])))

for d in datalist:
    print(d.to_raw())
