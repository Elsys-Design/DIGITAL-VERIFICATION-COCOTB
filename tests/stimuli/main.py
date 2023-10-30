import sys
from data_list import DataList
from stimuli_list import StimuliList
from fill_strategy import FillStrategy


stimlist = StimuliList.from_file(sys.argv[1])

for s in stimlist:
    print(s)
