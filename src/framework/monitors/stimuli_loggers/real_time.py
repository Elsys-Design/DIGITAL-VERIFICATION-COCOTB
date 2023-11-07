import os
import shutil
import json
from .base import BaseStimuliLogger


class RealTimeStimuliLogger(BaseStimuliLogger):

    def __init__(self, dir_path, id_base=""):
        super().__init__(dir_path, id_base)
        
        self.stimuli_file = open(self.stimuli_filepath, "wb")
        self.stimuli_file.write("[\n]".encode('utf-8'))

        self.is_first_stimuli = True


    def recv(self, stimuli):
        json_obj = stimuli.to_json(self.dir_path)
        
        self.stimuli_file.seek(-2, os.SEEK_END)

        toadd = ""
        if not self.is_first_stimuli:
            toadd += ','
        else:
            self.is_first_stimuli = False
        toadd += "\n" + json.dumps(json_obj, indent=4)
        toadd = toadd.replace("\n", "\n" + " "*4)
        toadd +="\n]"

        self.stimuli_file.write(toadd.encode('utf-8'))

    def __del__(self):
        self.stimuli_file.close()
