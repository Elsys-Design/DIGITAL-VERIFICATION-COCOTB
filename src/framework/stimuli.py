from enum import Enum
import random
import os
from dataclasses import dataclass

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


@dataclass
class Stimuli:
    _id : str
    access : Access
    rel_time : Time
    data_list : DataList
    desc : str = ""
    
    abs_time : int = 0


    @property
    def id(self):
        return self._id


    @classmethod
    def base_json_checks(cls, json):
        checked_fields = []

        def check_existance(field):
            if field not in json:
                raise KeyError("{} mandatory field is missing".format(field))
            checked_fields.append(field)

        def check_type(field, _type):
            # We need to check the existance before checking the type
            check_existance(field)
            if not isinstance(json[field], _type):
                raise ValueError("Field {} has a value of type {} instead of {}" \
                        .format(field, type(json[field]), _type))

        def check_value(field, _type, values):
            check_type(field, _type)
            if json[field] not in values:
                raise ValueError("{}: {} isn't valid".format(field, json[field]))

        def check_optional(field, _type):
            if field in json:
                # this call check_existance even though we already tested it
                # it's clearer and doesn't really affect performances
                check_type(field, _type)

        check_value("Type", str, ["Simple", "File"])
        check_value("Access", str, ["W", "R"])
        check_type("Address", str)
        check_type("RelTime", str)

        if json["Type"] == "Simple":
            check_type("Size", int)
            if json["Access"] == "W":
                check_type("Data", str)
        else: # type = File
            check_type("FileName", str)
            check_type("Fill", int)

        check_optional("ID", str)
        check_optional("Desc", str)

        unchecked_keys = set(json.keys()) - set(checked_fields)
        type_fields = unchecked_keys.intersection(set(["Size", "Data", "FileName", "Fill"]))
        if type_fields:
            raise KeyError("Fields {} are not valid for this Type ({})".format(type_fields, json["Type"]))

        unknown_fields = unchecked_keys - type_fields
        if unknown_fields:
            raise KeyError("Fields {} are not valid".format(unknown_fields))




    @classmethod
    def from_json(cls, json, data_dir_path, default_id = ""):

        cls.base_json_checks(json)

        # Throws an error if cannot convert Address to int
        # This is the base address added to the Data's address, any other check on this field is performed in Data
        addr = int(json["Address"], 0)

        # RelTime conversion to steps
        try:
            (value, unit) = json["RelTime"].split(' ')
            rel_time = Time(float(value), unit)
        except Exception as e:
            raise ValueError("RelTime field isn't properly formatted ({})".format(json["RelTime"]))

        access = Access.WRITE if json["Access"] == "W" else Access.READ

        _id = json["ID"] if "ID" in json else default_id
        desc = json["Desc"] if "Desc" in json else ""

        # Creating the data_list
        # Maybe this should be in Data ?
        if json["Type"] == "Simple":
            size = json["Size"]
            if access == Access.WRITE:
                data = int(json["Data"], 0)
                if data.bit_length() > 8*size:
                    # TODO: log warning
                    # Removing MSB to fit the size
                    data = data & (2**(8*size) - 1)
                data = bytearray(data.to_bytes(size, 'big'))
                data_list = DataList([Data(addr, data, True, data_format=DataFormat(size))])
            else:
                data = bytearray()
                FillStrategy.exec_on(FillStrategy.ZEROS, data, size)
                data_list = DataList([Data(addr, data, False, data_format=DataFormat(1))])
        else: # Type = File
            fill_strategy = json["Fill"]
            if access == Access.WRITE:
                data_list = DataList.from_file(os.path.join(data_dir_path, json["FileName"]), addr, fill_strategy)
            else:
                # TODO: Should this be implemented ?
                # See specs
                raise NotImplementedError("Access: R and Type: File are not compatible (Read accesses are Simple only, see the"
                                 "monitor's output to get the data)")
     
        return cls(_id, access, rel_time, data_list, desc)

    
    def to_json(self, data_dir_path):
        if len(self.data_list) != 1:
            raise NotImplementedError("Stimuli.to_json supports only one data item per stimuli")
        
        data = self.data_list[0]

        json = {
                "ID": self._id,
                "Desc": self.desc,
                "Access": str(self.access),
                "RelTime": str(self.rel_time),
                "AbsTime": str(self.abs_time),
                "Type": "Simple" if data.is_word() else "File",
                "Address": utils.int_to_hex_string(data.addr, data.dformat.addr_size)
        }

        # Addind desc anyway and removing it if it's empty
        # Done in this order to because it's printed in the order it's filled
        # and having Desc right after ID seems best
        if not self.desc:
            del json["Desc"]

        if json["Type"] == "Simple":
            # Data is always the size of a word
            json["Data"] = data.to_words()[0]
            # Size isn't the size of a word but the actual data size
            json["Size"] = len(data.data)
        else:
            json["FileName"] = self._id + ".dat"
            # Writing data file in data_dir
            # We suppose the data_dir_path is a directory
            self.data_list.to_file(os.path.join(data_dir_path, json["FileName"]), addr_to_zero = True)

        return json


def stimuli_default_generator(data_list_generator, delay_range, access = Access.ALL,
                        desc = "Stimuli {} generated using the default generator", _id = ""):
    if access == Access.ALL:
        access = random.choice([Access.WRITE, Access.READ])

    return Stimuli(
            _id,
            access,
            Time(random.choice(delay_range), "fs"),
            data_list_generator(),
            desc.format(_id)
    )

