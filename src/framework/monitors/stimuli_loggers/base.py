import os
import shutil

from ...stimuli import Stimuli


class BaseStimuliLogger:
    """
    Base class for all StimuliLoggers.

    Attributes:
        dir_path: Directory in which the stimuli.json file and the data files will be written.
        id_base: Base id name, actual id of stimulis will be "{id_base}_{stimuli_index}".
        is_stream_no_tlast: If True, it's assumed that Stimulis' Data will only contain one word and all Data will be
            written to the same Data file.
        stimuli_filepath: dir_path/stimulis.json, stored in an attribute to be able to change the stimulis.json name
            easily for all subclasses.
    """

    def __init__(
        self, dir_path: str, id_base: str = "", is_stream_no_tlast: bool = False
    ):
        """
        If the dir_path directory exists, it's replaced by a new (empty) one to be filled by the new Stimulis.
        If the dir_path directory doesn't exist, it's created.

        Args: see the attributes
        """
        self.dir_path = dir_path
        self.id_base = id_base
        self.is_stream_no_tlast = is_stream_no_tlast

        # store the stimuli filepath to use it in child classes
        self.stimuli_filepath = os.path.join(self.dir_path, "stimulis.json")

        # remove the whole directory if it exists
        if os.path.isdir(self.dir_path):
            shutil.rmtree(self.dir_path)
        # make a new directory, recursive if the path doesn't yet exist
        os.makedirs(self.dir_path)

    def write(self, stimuli: Stimuli) -> None:
        """
        Method to subscribe to AnalisysPorts.
        Should be implemented in child classes.

        Arguments:
            stimuli: The Stimuli object to log.
        """
        raise NotImplementedError(
            "BaseStimuliLogger shouldn't be used directly, use child classes."
        )
