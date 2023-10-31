import sys
import json
from data_list import DataList
from stimuli_list import StimuliList
from fill_strategy import FillStrategy


stimlist = StimuliList.from_file(sys.argv[1])

for s in stimlist:
    print(json.dumps(s.to_json(), indent=4))
