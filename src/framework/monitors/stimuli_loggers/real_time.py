import os
import shutil
import json
import logging
import copy

from .base import BaseStimuliLogger


class RealTimeStimuliLogger(BaseStimuliLogger):
    """
    Named real time because it logs received Stimuli (and Data) directly to files.
    """

    def __init__(self, dir_path, id_base="", is_stream_no_tlast=False):
        super().__init__(dir_path, id_base, is_stream_no_tlast)
        
        self.stimuli_file = open(self.stimuli_filepath, "wb")
        self.stimuli_file.write("[\n]".encode('utf-8'))

        self.is_first_stimuli = True

        self.logger = logging.getLogger("framework.real_time_stimuli_logger")

        if self.is_stream_no_tlast:
            self.data_filename = None
            self.data_file = None
            self.current_data = None


    def write(self, stimuli):
        """
        Method to subscribe to AnalisysPorts.
        """
        if not self.is_stream_no_tlast:
            self._append_to_json(stimuli.to_json(self.dir_path))
            return
        # Handling stream without tlast
        json_obj = stimuli.get_plain_json(force_to_file = True)
        if self.data_file is None:
            self.data_filename = json_obj["FileName"]
            self.data_file = open(os.path.join(self.dir_path, self.data_filename), "w")
            self.current_data = copy.deepcopy(stimuli.data_list[0])
        else:
            json_obj["FileName"] = self.data_filename
            self.current_data.data += stimuli.data_list[0].data
        json_obj["Desc"] = "Access on a bus that has no tlast"
        json_obj["Size"] = stimuli.data_list[0].length
        self._append_to_json(json_obj)
        self._update_data_file()
        
    def _append_to_json(self, obj):
        self.stimuli_file.seek(-2, os.SEEK_END)

        toadd = ""
        if not self.is_first_stimuli:
            toadd += ','
        else:
            self.is_first_stimuli = False
        toadd += "\n" + json.dumps(obj, indent=4)
        toadd = toadd.replace("\n", "\n" + " "*4)
        toadd +="\n]"

        self.stimuli_file.write(toadd.encode('utf-8'))
        self.stimuli_file.flush()

    def _update_data_file(self):
        """
        Only called if is_stream_no_tlast.
        Rewrittes the whole data file at every call because there is no other simple way to update the data length.
        """
        raw = self.current_data.to_raw(addr_to_zero = True) + '\n'
        self.data_file.seek(0, os.SEEK_SET)
        self.data_file.write(raw)
        self.data_file.flush()

       
    def __del__(self):
        self.stimuli_file.close()
        if self.is_stream_no_tlast and self.data_file is not None:
            self.data_file.close()

