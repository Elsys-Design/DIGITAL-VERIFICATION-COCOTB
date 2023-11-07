import os
import shutil
import json


class StimuliLogger:

    def __init__(self, dir_path, id_base=""):
        self.dir_path = dir_path
        self.id_base = id_base

        # remove the whole directory if it exists
        if os.path.isdir(self.dir_path):
            shutil.rmtree(self.dir_path)
        # make a new directory, recursive if the path doesn't yet exist
        os.makedirs(self.dir_path)

        self.stimuli_file = open(os.path.join(self.dir_path, "stimulis.json"), "wb")
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
        toadd += "\n" + json.dumps(json_obj, indent=4) + "\n]"

        self.stimuli_file.write(toadd.encode('utf-8'))

    def __del__(self):
        self.stimuli_file.close()
