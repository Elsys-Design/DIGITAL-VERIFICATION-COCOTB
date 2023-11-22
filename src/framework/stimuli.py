from enum import Enum
import random
import os
from dataclasses import dataclass
import json
from cocotb.triggers import Timer
import logging
from typing import Optional, List, Sequence, Callable, Dict, Union

from .fill_strategy import FillStrategy
from .data_list import DataList
from .data import Data, DataFormat
from .time import Time
from . import utils



class Access(Enum):
    """
    Access types.

    Access.ALL should only be used for random stimuli generation.
    """
    READ = 0
    WRITE = 1
    ALL = 2

    def __str__(self):
        return "R" if self == Access.READ else "W"


@dataclass(init=False)
class Stimuli:
    """
    Represents a single json object in Stimuli files.

    Attributes:
        id_: ID, not just named 'id' because it's a keyword in python
        access: Access (Read or Write)
        rel_time: Time between 2 Stimulis:
            For inputs, it's the delay from the moment the bus is idle to the moment the Stimuli is executed.
            For monitor logs, it's the delay from the moment the last Stimuli was executed to the moment this Stimuli is
                executed.
        data_list: Datas associated with this Stimuli.
        desc: Description of this Stimuli.

        abs_time: Absolute time of the transaction's start, set by monitors.
        end_time: Absolute time of the transaction's end, set by monitors

        logger: By default, the Stimuli class logger (used in classmethods).
            In actual Stimuli objects, the logger takes the name of the Stimuli id.
    """
    id_: str
    access: Access
    rel_time: Time
    data_list: DataList
    desc: str
    
    abs_time: Time
    end_time: Time

    logger = logging.getLogger("framework.stimuli")

    JsonObject = Dict[str, Union[str, int]]

    def __init__(
            self,
            id_: str,
            access: Access,
            rel_time: Time,
            data_list: List[Data],
            desc: str = "",
            abs_time: Optional[Time] = None,
            end_time: Optional[Time] = None
    ) -> None:
        """
        """
        self.id_ = id_
        self.access = access
        self.rel_time = rel_time
        self.data_list = data_list
        self.desc = desc
        self.abs_time = Time(0, 'fs') if abs_time is None else abs_time
        self.end_time = Time(0, 'fs') if end_time is None else end_time

        self.logger = logging.getLogger("framework.stimuli." + self.id_)

    @classmethod
    def _base_json_checks(cls, json_obj: JsonObject) -> None: 
        """
        Only checks:
        - the required fields existance
        - their types
        - the optional fields types
        - that there is no other field present

        Args:
            json_obj: The JSON object to check (which represents a Stimuli).

        Raises:
            ValueError: Parsing error.
            KeyError:   Parsing error.
        """
        checked_fields = []

        def check_existance(field):
            if field not in json_obj:
                raise KeyError("{} mandatory field is missing".format(field))
            checked_fields.append(field)

        def check_type(field, _type):
            # We need to check the existance before checking the type
            check_existance(field)
            if not isinstance(json_obj[field], _type):
                raise ValueError("Field {} has a value of type {} instead of {}" \
                        .format(field, type(json_obj[field]), _type))

        def check_value(field, _type, values):
            check_type(field, _type)
            if json_obj[field] not in values:
                raise ValueError("{}: {} isn't valid".format(field, json_obj[field]))

        def check_optional(field, _type):
            if field in json_obj:
                # this call check_existance even though we already tested it
                # it's clearer and doesn't really affect performances
                check_type(field, _type)

        check_value("Type", str, ["Simple", "File"])
        check_value("Access", str, ["W", "R"])
        check_type("Address", str)
        check_type("RelTime", str)

        if json_obj["Type"] == "Simple":
            check_type("Size", int)
            if json_obj["Access"] == "W":
                check_type("Data", str)
        else: # type = File
            check_type("FileName", str)
            check_type("Fill", int)

        check_optional("ID", str)
        check_optional("Desc", str)

        unchecked_keys = set(json_obj.keys()) - set(checked_fields)
        type_fields = unchecked_keys.intersection(set(["Size", "Data", "FileName", "Fill"]))
        if type_fields:
            raise KeyError("Fields {} are not valid for this Type ({})".format(type_fields, json_obj["Type"]))

        unknown_fields = unchecked_keys - type_fields
        if unknown_fields:
            raise KeyError("Fields {} are not valid".format(unknown_fields))


    @classmethod
    def _build_data_list(
            cls,
            json_obj: JsonObject,
            id_: str,
            access: Access,
            data_dir_path: str,
            is_stream: bool = False
    ) -> DataList:
        """
        Builds the data_list, either from json_obj fields or from a file depending on the Type.

        Args:
            id_: The new Stimuli ID.
            access: The new Stimuli Access.
            data_dir_path: The path to the data files.
            is_stream: Whether the parsed Data is an AXI-Stream data or not.
                An AXI-Stream Data doesn't need to be aligned so we shouldn't call Data.alignment_check.

        Returns:
            The DataList linked to the Stimuli represented by the json_obj.

        Raises:
            NotImplementedError: Read access with File type isn't supported, monitor logs are here for that.
                Note: Supporting the generation of a Data file from Reads would be easy and might be usefull.
        """
        addr = int(json_obj["Address"], 0)
        if json_obj["Type"] == "Simple":
            size = json_obj["Size"]
            if access == Access.WRITE:
                data = int(json_obj["Data"], 0)
                if data.bit_length() > 8*size:
                    cls.logger.warning(
                        "Data word 0x{word:X} is {word_size} bits long which is higher than the size specified"
                        "in the Size field ({descriptor_word_size} bits)" \
                        .format(word = data, word_size = data.bit_length(), descriptor_word_size = 8*size)
                    )
                    # Removing MSB to fit the size
                    data = data & (2**(8*size) - 1)
                data = bytearray(data.to_bytes(size, 'big'))
                data_obj = Data(addr, data, True, DataFormat(size))
                if not is_stream:
                    data_obj.alignment_check()
                return DataList([data_obj])
            else:
                # This Read data_obj is always aligned because its word_size == 1.
                # There is no strb on the read channel in AXI so we get whole words aligned on the bus size anyways.
                data_obj = Data.build_empty(addr, size, False, DataFormat(1))
                return DataList([data_obj])
        else: # Type = File
            fill_strategy = json_obj["Fill"]
            if fill_strategy == FillStrategy.RANDOM:
                # Generating and logging a custom seed
                fill_strategy = FillStrategy.generate_custom_seed()
                cls.logger.info("Generated fill strategy seed {} for Stimuli {}".format(fill_strategy, id_))
            if access == Access.WRITE:
                return DataList.from_file(
                        os.path.join(data_dir_path, json_obj["FileName"]),
                        addr,
                        fill_strategy,
                        is_stream
                )
            else:
                raise NotImplementedError("Access: R and Type: File are not compatible (Read accesses are Simple only, see the"
                                 "monitor's output to get the data)")



    @classmethod
    def from_json(
            cls,
            json_obj: JsonObject,
            data_dir_path: str,
            defaultid: str = "",
            is_stream: bool = False
    ) -> 'Stimuli':
        """
        Creates a Stimuli object from a json object.

        Args:
            json_obj: Json object from which the Stimuli is built.
            data_dir_path: The path to the data files.
            defaultid: Default Stimuli ID if the json_obj doesn't specify one.
                This argument allows the StimuliList to give an ID based on the filename and the index of the json_obj.
            is_stream: Whether the Stimuli refers to AXI-Stream datas or not.
        """
        cls.logger.info("Building Stimuli from json_obj (data_dir_path = {}, defaultid = {})" \
                .format(data_dir_path, defaultid))
        cls.logger.debug("\n" + json.dumps(json_obj))

        cls._base_json_checks(json_obj)

        # RelTime conversion to Time
        try:
            (value, unit) = json_obj["RelTime"].split(' ')
            rel_time = Time(float(value), unit)
        except Exception as e:
            raise ValueError("RelTime field isn't properly formatted ({})".format(json_obj["RelTime"]))

        access = Access.WRITE if json_obj["Access"] == "W" else Access.READ

        id_ = json_obj["ID"] if "ID" in json_obj else defaultid
        desc = json_obj["Desc"] if "Desc" in json_obj else ""

        # Building the data_list
        data_list = cls._build_data_list(json_obj, id_, access, data_dir_path, is_stream)

        cls.logger.info("Stimuli built from json_obj")
             
        return cls(id_, access, rel_time, data_list, desc)

    
    def get_plain_json(self, force_to_file: bool = False) -> JsonObject:
        """
        Returns a json object representing this Stimuli.
        It doesn't write any file directly (the data isn't written).

        Only properly supports Stimuli objects that contain one and only one Data.
        Partial support for multiple Data exists but only the address of the first data will be in JSON.
        This is because it's specified the address should be in the JSON so there is only one place for it but it's
        stored in the Data object.

        Args:
            force_to_file: If True, the Data object(s) will be written to file regardless of other parameters
                (it'll be written to a file even though the Data is a single word).
                This allows StimuliLoggers to log Stimulis in specific ways.

        Returns:
            The json object representing this Stimuli.

        Raises:
            NotImplementedError: Cannot transform a Stimuli with no Data to json (where would we get the address ?).
        """

        if len(self.data_list) == 0:
            raise NotImplementedError(
                "Json conversion of stimuli with no associated data (data_list empty) isn't supported."
            )
        
        data = self.data_list[0]

        if len(self.data_list) > 1:
            self.logger.warning(
                    "Json conversion of stimuli with {} > 1 data items is only partially supported."
                    "Only the address of the first data ({}) will be in the json object" \
                    .format(len(self.data_list), data.addr)
            )


        # not data.is_allocated => Reads that are printed back before actually being read
        if (data.is_word() or not data.is_allocated) \
            and len(self.data_list) == 1 \
            and not force_to_file:
            type_ = "Simple"
        else:
            type_ = "File"


        json_obj = {
                "ID": self.id_,
                "Desc": self.desc,
                "Access": str(self.access),
                "RelTime": str(self.rel_time),
                "AbsTime": self.abs_time.full_str(),
                "Type": type_,
                "Address": utils.int_to_hex_string(int(data.addr), int(data.dformat.addr_size))
        }

        # Addind desc anyway and removing it if it's empty
        # Done in this order to because it's printed in the order it's filled
        # and having Desc right after ID seems best
        if not self.desc:
            del json_obj["Desc"]

        if type_ == "Simple":
            if data.is_allocated:
                # Data is always the size of a word
                json_obj["Data"] = data.to_words()[0]
            # Size isn't the size of a word but the actual data size
            json_obj["Size"] = data.length
        else:
            json_obj["FileName"] = self.id_ + ".dat"

        return json_obj

    def to_json(self, data_dir_path: str) -> JsonObject:
        """
        Similar to get_plain_json() but it also writes the data to a file.

        Args:
            data_dir_path: Path to the directory where the Stimuli's Data will be written to a file.

        Returns:
            The json object representing this Stimuli.
        """
        json_obj = self.get_plain_json()
        if json_obj["Type"] == "File":
            # Writing data file in data_dir
            # We suppose the data_dir_path is a directory
            filepath = os.path.join(data_dir_path, json_obj["FileName"])
            self.logger.info("Writting Stimuli datalist to {}".format(filepath))
            self.data_list.to_file(filepath, addr_to_zero = True)

        return json_obj


    async def run(self, driver) -> None:
        """
        Running the stimuli on the driver.

        Args:
            driver: The driver to run the Stimuli with.

        Raises:
            NotImplementedError: Read access with more than 1 Data object isn't supported.
        """
        
        self.logger.debug("Stimuli waits {}".format(self.rel_time))

        await self.rel_time.wait()
        
        self.logger.debug("Stimuli waited {} and starts running".format(self.rel_time))

        # Updating start time to the real value
        self.abs_time = Time.now()

        if self.access == Access.WRITE:
            await driver.write_datalist(self.data_list)
        else:
            if len(self.data_list) > 1:
                raise NotImplementedError("Reading more than 1 Data from Stimuli isn't supported")
            await driver.read_data(self.data_list[0])
        
        self.end_time = Time.now()

        self.logger.info("Stimuli's run ended")

    def short_desc(self) -> str:
        """
        Returns:
            A short description, usefull for logging.

        Raises:
            NotImplementedError: Not implemented for Stimulis with no Data object.
        """
        if len(self.data_list) == 0:
            raise NotImplementedError("short_desc is only supported on Stimulis that have at least one Data object")
        return "Stimuli(id={}, access={}, address={}, size={})" \
                .format(self.id_, self.access, self.data_list[0].addr, self.data_list[0].length)



def stimuli_default_generator(
        data_list_generator: Callable,
        delay_range: Sequence[int],
        access: Access = Access.ALL,
        desc: str = "Stimuli {id_} generated using the default generator",
        id_: str = ""
) -> Stimuli:
    """
    Default random stimuli generator.
    Provided as an example but it fits many usecases.

    Args:
        data_list_generator: DataList generator function.
        delay_range: Sequence of possible delays in simulator 'step' (unit = 'step').
        access: Access type, if it's Access.ALL then the access type is random (equal probability of write and read).
        desc: Description of the generated Stimulis. The `{id_}` in it will be replaced by the id of the Stimuli.
        id_: ID of the Stimuli, there is no randomisation on this field.

    Returns:
        A randomly generated Stimuli.
    """
    if access == Access.ALL:
        access = random.choice([Access.WRITE, Access.READ])

    return Stimuli(
            id_,
            access,
            Time(random.choice(delay_range), "step"),
            data_list_generator(fill_data = access == Access.WRITE),
            desc.format(id_=id_)
    )

