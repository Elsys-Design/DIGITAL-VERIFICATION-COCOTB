import os
import shutil


class BaseStimuliLogger:

    def __init__(self, dir_path, id_base=""):
        self.dir_path = dir_path
        self.id_base = id_base

        # remove the whole directory if it exists
        if os.path.isdir(self.dir_path):
            shutil.rmtree(self.dir_path)
        # make a new directory, recursive if the path doesn't yet exist
        os.makedirs(self.dir_path)

        self.stimuli_filepath = os.path.join(self.dir_path, "stimulis.json")


    def recv(self, stimuli):
        raise NotImplementedError("To implement in child classes")
