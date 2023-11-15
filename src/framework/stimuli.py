from enum import Enum
import random
import os
from dataclasses import dataclass
import json
from cocotb.triggers import Timer
import logging

from .fill_strategy import FillStrategy
from .data_list import DataList
from .data import Data, DataFormat
from .time import Time
from . import utils


class Access(Enum):
    READ = 0
    WRITE = 1
    ALL = 2 # Should only be used for random stimuli generation

    def __str__(self):
        return "R" if self == Access.READ else "W"


@dataclass(init=False)
class Stimuli:
    """
    Represents a single json object in Stimuli files
    """

    # id is a keyword in python
    id_ : str
    access : Access
    rel_time : Time
    data_list : DataList
    desc : str = ""
    
    abs_time : Time = Time(0, 'fs')
    end_time : Time = Time(0, 'fs')

    logger = logging.getLogger("framework.stimuli")

#    @property
#    def logger(self):
#        return logging.getLogger("framework.stimuli." + self.id_)

    def __init__(self, id_, access, rel_time, data_list, desc = "", abs_time = Time(0, 'fs'), end_time = Time(0, 'fs')):
        self.id_ = id_
        self.access = access
        self.rel_time = rel_time
        self.data_list = data_list
        self.desc = desc
        self.abs_time = abs_time
        self.end_time = end_time

        self.logger = logging.getLogger("framework.stimuli." + self.id_)

    @classmethod
    def _base_json_checks(cls, json_obj):
        """
        Only checks:
        - the required fields existance
        - their types
        - the optional fields types
        - that there is no other field present
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
    def _build_data_list(cls, json_obj, id_, access, data_dir_path, is_stream = False):
        """
        Builds the data_list, either from json_obj fields or from a file depending on the Type.
        """
        # TODO: clean this up
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
                if is_stream:
                    data_obj.alignment_check()
                return DataList([data_obj])
            else:
                data = bytearray()
                FillStrategy.exec_on(FillStrategy.ZEROS, data, size)
                data_obj = Data(addr, data, False, DataFormat(1))
                if is_stream:
                    data_obj.alignment_check()
                return DataList([data_obj])
        else: # Type = File
            fill_strategy = json_obj["Fill"]
            if fill_strategy == FillStrategy.RANDOM:
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
    def from_json(cls, json_obj, data_dir_path, defaultid = "", is_stream = False):
        """
        Creates a Stimuli object from a json object.
        """
        cls.logger.info("Building Stimuli from json_obj (data_dir_path = {}, defaultid = {})" \
                .format(data_dir_path, defaultid))
        cls.logger.debug("\n" + json.dumps(json_obj))

        cls._base_json_checks(json_obj)

        # RelTime conversion to steps
        try:
            (value, unit) = json_obj["RelTime"].split(' ')
            rel_time = Time(float(value), unit)
        except Exception as e:
            raise ValueError("RelTime field isn't properly formatted ({})".format(json_obj["RelTime"]))

        access = Access.WRITE if json_obj["Access"] == "W" else Access.READ

        id_ = json_obj["ID"] if "ID" in json_obj else defaultid
        desc = json_obj["Desc"] if "Desc" in json_obj else ""

        # Creating the data_list
        data_list = cls._build_data_list(json_obj, id_, access, data_dir_path, is_stream)

        cls.logger.info("Stimuli built from json_obj")
             
        return cls(id_, access, rel_time, data_list, desc)

    
    def get_plain_json(self, force_to_file = False):
        """
        Transforms a Stimuli object to a json object.

        Only properly supports Stimuli objects that contain one and only one Data.
        Partial support for multiple Data exists but only the address of the first data will be in JSON.
        This is because it's specified the address should be in the JSON so there is only one place for it but it's
        stored in the Data object.
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

        if json_obj["Type"] == "Simple":
            if data.is_allocated:
                # Data is always the size of a word
                json_obj["Data"] = data.to_words()[0]
            # Size isn't the size of a word but the actual data size
            json_obj["Size"] = data.length
        else:
            json_obj["FileName"] = self.id_ + ".dat"

        return json_obj

    def to_json(self, data_dir_path):
        json_obj = self.get_plain_json()
        if json_obj["Type"] == "File":
            # Writing data file in data_dir
            # We suppose the data_dir_path is a directory
            filepath = os.path.join(data_dir_path, json_obj["FileName"])
            self.logger.info("Writting Stimuli datalist to {}".format(filepath))
            self.data_list.to_file(filepath, addr_to_zero = True)

        return json_obj


    async def run(self, master):
        
        self.logger.debug("Stimuli waits {}".format(self.rel_time))

        await self.rel_time.wait()
        
        self.logger.debug("Stimuli waited {} and starts running".format(self.rel_time))

        # Updating start time to the real value
        self.abs_time = Time.now()

        if self.access == Access.WRITE:
            await master.write_datalist(self.data_list)
        else:
            if len(self.data_list) > 1:
                raise NotImplementedError("Reading more than 1 Data from Stimuli isn't supported")
            await master.read_data(self.data_list[0])
        
        self.end_time = Time.now()

        self.logger.info("Stimuli's run ended")

    def short_desc(self):
        if len(self.data_list) == 0:
            raise NotImplementedError("short_desc is only supported on Stimulis that have at least one Data object")
        return "Stimuli(id={}, access={}, address={}, size={})" \
                .format(self.id_, self.access, self.data_list[0].addr, self.data_list[0].length)



def stimuli_default_generator(data_list_generator, delay_range, access = Access.ALL,
                        desc = "Stimuli {} generated using the default generator", id_ = ""):
    """
    Default random stimuli generator
    Provided as an example but it fits many usecases
    """
    if access == Access.ALL:
        access = random.choice([Access.WRITE, Access.READ])

    return Stimuli(
            id_,
            access,
            Time(random.choice(delay_range), "fs"),
            data_list_generator(fill_data = access == Access.WRITE),
            desc.format(id_)
    )

