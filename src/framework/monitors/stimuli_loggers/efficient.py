import json
import copy
import os
import logging

from ...stimuli_list import StimuliList
from ...stimuli import Stimuli
from .base import BaseStimuliLogger
from ...data_list import DataList


class EfficientStimuliLogger(BaseStimuliLogger):
    """
    StimuliLogger that only write the files when asked to (see write_to_dir method).
    However it must keep all the stimulis stored in the self.stimulis list.

    Attributes:
        stimulis: List of all logged Stimulis.
        logger: Class logger, inherits from the framework's logger
    """

    logger = logging.getLogger("framework.efficient_stimuli_logger")

    def __init__(
        self, dir_path: str, id_base: str = "", is_stream_no_tlast: bool = False
    ):
        super().__init__(dir_path, id_base, is_stream_no_tlast)

        self.stimulis = StimuliList()

    def write(self, stimuli: Stimuli) -> None:
        """
        Method to subscribe to AnalisysPorts.

        Args:
            stimuli: Stimuli to log.
        """
        self.stimulis.append(stimuli)

    def write_to_dir(self) -> None:
        """
        Writes the logs to self.dir_path.
        """
        if not self.is_stream_no_tlast:
            # In almost all cases, we'll just use the StimuliList.write_to_dir method
            self.stimulis.write_to_dir(self.dir_path)

        elif len(self.stimulis) > 0:
            # This is just to handle AXI-Stream buses that have no tlast (they're printed in a specific way)
            json_objs = [self.stimulis[0].get_plain_json(force_to_file=True)]
            json_objs[0]["Desc"] = "Access on a bus that has no tlast"
            json_objs[0]["Size"] = self.stimulis[0].data_list[0].length
            full_data = copy.deepcopy(self.stimulis[0].data_list[0])
            full_data.ends_with_tlast = False
            for stim in self.stimulis[1:]:
                new_json_obj = stim.get_plain_json(force_to_file=True)
                new_json_obj["FileName"] = json_objs[0]["FileName"]
                new_json_obj["Desc"] = json_objs[0]["Desc"]
                new_json_obj["Size"] = stim.data_list[0].length
                json_objs.append(new_json_obj)
                full_data.data += stim.data_list[0].data

            DataList([full_data]).to_file(
                os.path.join(self.dir_path, json_objs[0]["FileName"]), addr_to_zero=True
            )
            stimuli_file = open(self.stimuli_filepath, "w")
            json.dump(json_objs, stimuli_file, indent=4, ensure_ascii=False)
            stimuli_file.close()
