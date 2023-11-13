import json
import copy
import os

from ...stimuli_list import StimuliList
from .base import BaseStimuliLogger
from ...data_list import DataList


class EfficientStimuliLogger(BaseStimuliLogger):

    def __init__(self, dir_path, id_base="", is_stream_no_tlast=False):
        super().__init__(dir_path, id_base)

        self.is_stream_no_tlast = is_stream_no_tlast
        self.stimulis = StimuliList()


    def recv(self, stimuli):
        self.stimulis.append(stimuli)

    def write_to_dir(self):
        if not self.is_stream_no_tlast:
            self.stimulis.write_to_dir(self.dir_path)

        # This is just to handle AXI-Stream buses that have no tlast
        elif len(self.stimulis) > 0:
            json_objs = [self.stimulis[0].get_plain_json(force_to_file = True)]
            json_objs[0]["Desc"] = "Access on a bus that has no tlast"
            full_data = copy.deepcopy(self.stimulis[0].data_list[0])
            full_data.ends_with_tlast = False
            for stim in self.stimulis[1:]:
                new_json_obj = stim.get_plain_json(force_to_file = True)
                new_json_obj["FileName"] = json_objs[0]["FileName"]
                new_json_obj["Desc"] = json_objs[0]["Desc"]
                json_objs.append(new_json_obj)
                full_data.data += stim.data_list[0].data

            DataList([full_data]).to_file(os.path.join(self.dir_path, json_objs[0]["FileName"]), addr_to_zero = True)
            stimuli_file = open(self.stimuli_filepath, "w")
            json.dump(json_objs, stimuli_file, indent=4, ensure_ascii=False) 
            stimuli_file.close()
