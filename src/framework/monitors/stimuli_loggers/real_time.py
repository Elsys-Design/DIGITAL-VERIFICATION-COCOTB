import os
import shutil
import json

from .base import BaseStimuliLogger
from ...logger import logger


class RealTimeStimuliLogger(BaseStimuliLogger):
    """
    Named real time because it logs received Stimuli (and Data) directly to files.

    /!\ Specific logging format for AxiStream without tlast isn't supported.
    """

    def __init__(self, dir_path, id_base="", is_stream_no_tlast=False):
        super().__init__(dir_path, id_base, is_stream_no_tlast)
        
        self.stimuli_file = open(self.stimuli_filepath, "wb")
        self.stimuli_file.write("[\n]".encode('utf-8'))

        self.is_first_stimuli = True

        if self.is_stream_no_tlast:
            logger.warning("RealTimeStimuliLogger created with is_stream_no_tlast = True but doesn't support the" \
                            "specific format associated (writes into {})".format(self.dir_path))


    def recv(self, stimuli):
        """
        Method to subscribe to AnalisysPorts.
        """
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

