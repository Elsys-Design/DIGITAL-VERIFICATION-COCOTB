from enum import StrEnum
import random
import os
from dataclasses import dataclass

from .fill_strategy import FillStrategy
from .data_list import DataList
from .data import Data
from .time import Time


class Access(StrEnum):
    READ = "R"
    WRITE = "W"
    ALL = "A" # Should only be used for random stimuli generation


@dataclass
class Stimuli:

    _id : str
    access : Access
    rel_time : Time
    data_list : DataList
    desc : str = ""
    
    abs_time : int = 0


    @classmethod
    def from_json(cls, json, data_dir_path, default_id = ""):
        mandatory = ["Access", "RelTime", "Type", "Address"]


        def check_fields_existance(mandatory, optional):
            for field in mandatory:
                if field not in json.keys():
                    raise KeyError("{} mandatory field is missing".format(field))
            all_fields = mandatory + optional
            for field in json.keys():
                if field not in all_fields:
                    raise KeyError("{} field isn't recognised")

        def check_field(field, values):
            if json[field] not in values:
                raise ValueError("{}: {} isn't valid".format(field, json[field]))


        if "Type" not in json.keys():
            raise KeyError("Type mandatory field is missing")
        _type = json["Type"]


        if "Access" not in json.keys():
            raise KeyError("Access mandatory field is missing")
        access = Access.WRITE if json["Access"] == "W" else Access.READ

        if _type == "Simple":
            mandatory += ["Size"]
            if access == Access.WRITE:
                mandatory += ["Data"]
        elif _type == "File":
            mandatory += ["FileName", "Fill"]
        else:
            raise ValueError("Type {} isn't valid".format(_type))

        optional = ["ID", "Desc"]
        check_fields_existance(mandatory, optional)

        check_field("Type", ["Simple", "File"])
        check_field("Access", ["W", "R"])

        # Throws an error if cannot convert Address to int
        # TODO: throw an error with a custom message
        addr = int(json["Address"], 0)

        # RelTime conversion to steps
        (value, unit) = json["RelTime"].split(' ')
        rel_time = Time(float(value), unit)

        access = Access.WRITE if json["Access"] == "W" else Access.READ

        
        # Creating the data_list
        if _type == "Simple":
            size = int(json["Size"], 0)
            if access == Access.WRITE:
                data = int(json["Data"], 0)
                # Removing MSB to fit the size
                data = data & (2**(8*size) - 1)
                data = bytearray(data.to_bytes(size, 'big'))
                data_list = DataList([Data(addr, data, True)])
            else:
                data = bytearray()
                FillStrategy.ZEROS.exec_on(data, size)
                data_list = DataList([Data(addr, data)])
        else: # Type = File
            check_field("Fill", [-1, 0, 1])
            fill_strategy = FillStrategy(json["Fill"])

            if not isinstance(json["FileName"], str):
                raise TypeError("FileName must be a string")

            if access == Access.WRITE:
                data_list = DataList.from_file(data_dir_path + json["FileName"], addr, fill_strategy)
            else:
                # TODO: Should this be implemented ?
                # See specs
                raise NotImplementedError("Access: R and Type: File are not compatible (Read accesses are Simple only, see the"
                                 "monitor's output to get the data)")

        _id = json["ID"] if "ID" in json else default_id
        desc = json["Desc"] if "Desc" in json else ""

     
        return cls(_id, access, rel_time, data_list, desc)

    
    def to_json(self, data_dir_path):
        if len(self.data_list) != 1:
            raise NotImplementedError("Stimuli.to_json supports only one data item per stimuli")
        
        data = self.data_list[0]

        json = {
                "ID": self._id,
                "Desc": self.desc,
                "Access": self.access,
                "RelTime": str(self.rel_time),
                "AbsTime": str(self.abs_time),
                "Type": "Simple" if data.is_word() else "File",
                "Address": data.addr
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
            self.data_list.to_file(os.path.join(data_dir_path, json["FileName"]))

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

