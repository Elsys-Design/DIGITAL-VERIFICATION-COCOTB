import sys
from data_list import DataList
from fill_strategy import FillStrategy


datalist = DataList.from_file(sys.argv[1], 0, FillStrategy.ZEROS)

for d in datalist:
    print(d.to_raw())
