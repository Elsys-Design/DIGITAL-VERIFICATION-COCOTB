import sys
import json
from framework.data_list import DataList
from framework.stimuli_list import StimuliList
from framework.fill_strategy import FillStrategy


stimlist = StimuliList.from_file(sys.argv[1])

for s in stimlist:
    print(json.dumps(s.to_json("outputs"), indent=4))
