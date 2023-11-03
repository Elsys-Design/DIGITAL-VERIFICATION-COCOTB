import os
import shutil
import json
import random
from pathlib import Path 
from .stimuli import Stimuli

class StimuliList(list):

    def __init__(self, base=[]):
        super().__init__(base)

    @classmethod
    def from_file(cls, filename):
        f = open(filename, "r", encoding="utf-8")
        data = json.load(f)
        f.close()

        stimulis = cls()
        id_list = []
        for i in range(len(data)):
            stimulis.append(
                Stimuli.from_json(data[i], os.path.dirname(filename), Path(filename).stem + "_{}".format(i))
            )
            if stimulis[-1].id_ in id_list:
                raise ValueError("Stimuli ID {} already exists in this stimuli list".format(stimulis[-1].id_))
            id_list.append(stimulis[-1].id_)

        return stimulis


    def write_to_dir(self, output_dir_path):
        if os.path.isdir(output_dir_path):
            shutil.rmtree(output_dir_path)
        os.makedirs(output_dir_path)

        json_array = []
        for i in range(len(self)):
            json_array.append(self[i].to_json(output_dir_path))

        json_file = open(os.path.join(output_dir_path, "stimulis.json"), "w", encoding="utf-8")
        json.dump(json_array, json_file, indent=4, ensure_ascii=False)
        json_file.close()


def stimulilist_default_generator(stimuli_generator, size_range):
    size = random.choice(size_range)
    out = StimuliList()
    for i in range(size):
        out.append(stimuli_generator(_id = str(i)))
    return out

