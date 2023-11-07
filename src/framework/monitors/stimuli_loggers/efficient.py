import json
from ...stimuli_list import StimuliList
from .base import BaseStimuliLogger


class EfficientStimuliLogger(BaseStimuliLogger):

    def __init__(self, dir_path, id_base="", write_on_delete = True):
        super().__init__(dir_path, id_base)

        self.write_on_delete = write_on_delete
        self.stimulis = StimuliList()


    def recv(self, stimuli):
        self.stimulis.append(stimuli)

    def write_to_dir(self):
        self.stimulis.write_to_dir(self.dir_path)

    def __del__(self):
        if self.write_on_delete:
            self.write_to_dir()
