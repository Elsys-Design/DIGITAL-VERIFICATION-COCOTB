import sys
import logging

from framework import DataList, FillStrategy, logger


logger.setLevel(logging.CRITICAL + 1)

if len(sys.argv) != 3:
    raise ValueError("Args: data_file_path fill_strategy")

datalist = DataList.from_file(sys.argv[1], 0, int(sys.argv[2]))

for d in datalist:
    print(d.to_raw())
