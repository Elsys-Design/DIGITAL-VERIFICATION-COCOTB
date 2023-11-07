import os
import shutil
import json
import random
from pathlib import Path 

from .stimuli import Stimuli
from .logger import logger


class StimuliList(list):
    """
    This class represents a stimulis.json file (an array of json objects, each representing a Stimuli).
    """

    def __init__(self, base=[]):
        super().__init__(base)

    @classmethod
    def from_file(cls, filename, is_aligned = False):
        """
        Creates a StimuliList from a json file (filename).
        The FileName attributes in json are relative to the directory in which the json file is.
        """
        logger.info("Building StimuliList from {}".format(filename))

        f = open(filename, "r", encoding="utf-8")
        data = json.load(f)
        f.close()

        stimulis = cls()
        id_list = []
        for i in range(len(data)):
            stimulis.append(
                Stimuli.from_json(
                    data[i],
                    os.path.dirname(filename),
                    Path(filename).stem + "_{}".format(i),
                    is_aligned
                )
            )
            if stimulis[-1].id_ in id_list:
                raise ValueError("Stimuli ID {} already exists in this stimuli list".format(stimulis[-1].id_))
            id_list.append(stimulis[-1].id_)
        
        logger.info("StimuliList built from {}".format(filename))

        return stimulis


    def write_to_dir(self, output_dir_path):
        """
        Writes a whole StimuliList to a directory.
        The stimuli file is named 'stimuli.json'.
        """
        logger.info("Writing StimuliList to {}".format(output_dir_path))

        if os.path.isdir(output_dir_path):
            shutil.rmtree(output_dir_path)
        os.makedirs(output_dir_path)

        json_array = []
        for i in range(len(self)):
            json_array.append(self[i].to_json(output_dir_path))

        json_file = open(os.path.join(output_dir_path, "stimulis.json"), "w", encoding="utf-8")
        json.dump(json_array, json_file, indent=4, ensure_ascii=False)
        json_file.close()
        
        logger.info("StimuliList written to {}".format(output_dir_path))

    async def run(self, master):
        logger.info("StimuliList starts running")

        for stim in self:
            await stim.run(master)

        logger.info("StimuliList's run ended")





def stimulilist_default_generator(stimuli_generator, size_range):
    """
    Random stimuli list generator
    """
    size = random.choice(size_range)
    out = StimuliList()
    for i in range(size):
        out.append(stimuli_generator(_id = str(i)))
    return out

