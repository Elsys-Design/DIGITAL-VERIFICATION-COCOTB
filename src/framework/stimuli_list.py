import os
import shutil
import json
from .stimuli import Stimuli

class StimuliList(list):

    def __init__(self, base=[]):
        super().__init__(base)

    @classmethod
    def from_file(cls, filename):
        f = open(filename)
        data = json.load(f)
        f.close()

        stimulis = cls()
        for i in range(len(data)):
            stimulis.append(
                Stimuli.from_json(data[i], os.path.dirname(filename), os.path.splitext(filename)[0] + "_{}".format(i))
            )

        return stimulis

    def write_to_dir(self, output_dir_path):
       raise NotImplementedError("See StimuliLog implementation to write to dir") 

