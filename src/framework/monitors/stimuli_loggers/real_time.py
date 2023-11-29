import os
import shutil
import json
import logging
import copy

from .base import BaseStimuliLogger
from ...stimuli import Stimuli
from ...custom_types import JsonObject


class RealTimeStimuliLogger(BaseStimuliLogger):
    """
    Logs received Stimuli (and Data) directly to files.
    Not optimised for axi stream without tlast (but it works): it simply rewrittes the whole Data file every time
    a Stimuli is added.

    Attributes:
        logger: Class logger, inherits from the framework's logger
        stimuli_file: Opened file to the stimuli object.
        is_first_stimuli: True if no stimuli were received yet. Becomes False when the first stimuli is received.

        data_filename: Only when self.is_stream_no_tlast == True, stores the unique Data file name.
        data_file: Only when self.is_stream_no_tlast == True, stores the unique Data file handle (opened).
        current_data: Only when self.is_stream_no_tlast == True, stores the whole data item.
    """
    logger = logging.getLogger("framework.real_time_stimuli_logger")

    def __init__(self, dir_path: str, id_base: str = "", is_stream_no_tlast: bool = False):
        super().__init__(dir_path, id_base, is_stream_no_tlast)
        
        self.stimuli_file = open(self.stimuli_filepath, "wb")
        self.stimuli_file.write("[\n]".encode('utf-8'))

        self.is_first_stimuli = True

        if self.is_stream_no_tlast:
            self.data_filename = None
            self.data_file = None
            self.current_data = None


    def write(self, stimuli: Stimuli) -> None:
        """
        Method to subscribe to AnalisysPorts.

        Args:
            stimuli: Stimuli to log.
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
        
    def _append_to_json(self, obj: JsonObject) -> None:
        """
        Args:
            obj: JSON object to append to the json file.
        """
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

    def _update_data_file(self) -> None:
        """
        Only called if is_stream_no_tlast.
        Rewrittes the whole data file at every call because there is no other simple way to update the data length.
        """
        raw = self.current_data.to_raw(addr_to_zero = True) + '\n'
        self.data_file.seek(0, os.SEEK_SET)
        self.data_file.write(raw)
        self.data_file.flush()

       
    def __del__(self) -> None:
        """
        Closes opened files.
        """
        self.stimuli_file.close()
        if self.is_stream_no_tlast and self.data_file is not None:
            self.data_file.close()

