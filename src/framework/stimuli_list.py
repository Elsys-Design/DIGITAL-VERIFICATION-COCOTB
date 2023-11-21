import os
import shutil
import json
import random
from pathlib import Path 
import logging
from typing import List, Sequence, Callable

from .stimuli import Stimuli


class StimuliList(list):
    """
    This class represents a stimulis.json file (an array of json objects, each representing a Stimuli).

    Attributes:
        name: Name of the StimuliList, usefull only for logging purposes.
            It's set by the from_file method to the json filename without the .json extension.
        logger: By default, the StimuliList class logger (used in classmethods).
            In actual StimuliList objects, the logger takes the name of the StimuliList.
    """
    logger = logging.getLogger("framework.stimuli_list")

    def __init__(self, base: List[Stimuli] = [], name: str = "") -> None:
        """
        """
        super().__init__(base)

        self.name = name
        self.logger = logging.getLogger("framework.stimuli_list." + self.name)

    @classmethod
    def from_file(cls, filepath: str, is_stream: bool = False) -> None:
        """
        Builds a StimuliList from a json file (filepath).
        The filepath attributes in json are relative to the directory in which the json file is.

        Args:
            filepath: JSON Stimuli file path.
            is_stream: If True, the parsed Stimulis are assumed to be used on AXI-Stream buses later.
        """
        cls.logger.info("Building StimuliList from {}".format(filepath))

        f = open(filepath, "r", encoding="utf-8")
        data = json.load(f)
        f.close()

        stimulis = cls(name=Path(filepath).stem)
        id_list = []
        for i in range(len(data)):
            stimulis.append(
                Stimuli.from_json(
                    data[i],
                    os.path.dirname(filepath),
                    stimulis.name + "_{}".format(i),
                    is_stream
                )
            )
            if stimulis[-1].id_ in id_list:
                raise ValueError("Stimuli ID {} already exists in this stimuli list".format(stimulis[-1].id_))
            id_list.append(stimulis[-1].id_)
        
        cls.logger.info("StimuliList built from {}".format(filepath))

        return stimulis


    def write_to_dir(self, output_dir_path: str) -> None:
        """
        Writes a whole StimuliList to a directory.
        The stimuli file is named 'stimulis.json'.

        Args:
            output_dir_path: Path to the output directory.
                If the directory doesn't exist, it's created.
        """
        self.logger.info("Writing StimuliList to {}".format(output_dir_path))

        if os.path.isdir(output_dir_path):
            shutil.rmtree(output_dir_path)
        os.makedirs(output_dir_path)

        json_array = []
        for i in range(len(self)):
            json_array.append(self[i].to_json(output_dir_path))

        json_file = open(os.path.join(output_dir_path, "stimulis.json"), "w", encoding="utf-8")
        json.dump(json_array, json_file, indent=4, ensure_ascii=False)
        json_file.close()
        
        self.logger.info("StimuliList written to {}".format(output_dir_path))

    async def run(self, driver) -> None:
        """
        Running all stimulis on the driver.

        Args:
            driver: The driver to run all the Stimulis with.
        """
        self.logger.info("StimuliList starts running")

        for stim in self:
            await stim.run(driver)

        self.logger.info("StimuliList's run ended")





def stimulilist_default_generator(stimuli_generator: Callable, size_range: Sequence[int]) -> StimuliList:
    """
    Random StimuliList generator.

    Args:
        stimuli_generator: Stimuli generator function.
        size_range: Sequence of possible sizes.

    Returns:
        A randomly generated StimuliList.
    """
    size = random.choice(size_range)
    out = StimuliList()
    for i in range(size):
        out.append(stimuli_generator(id_ = str(i)))
    return out

