#!/bin/env python

import sys
import os
import json

from framework.data import Data, DataFormat
from framework.data_list import DataList
from framework.stimuli import Stimuli, Access
from framework.stimuli_list import StimuliList
from framework.fill_strategy import FillStrategy
from framework.time import Time


file = "stimulis"


reference_stimlist = StimuliList([
    Stimuli(
        id_ = file + "_0",
        access = Access.WRITE,
        rel_time = Time(100, "ps"),
        desc = "exemple d'écriture de 4 octets 125  @0x12345678 à T=100 ps",
        data_list = DataList([Data(
            addr = 0x12345678,
            data = bytearray(int(125).to_bytes(4, 'big')),
            ends_with_tlast = True,
            dformat = DataFormat(4)
        )])
    ),

    Stimuli(
        id_ = "TEST2",
        access = Access.WRITE,
        rel_time = Time(100.1, "ns"),
        desc = "exemple d'écriture de 1 octet 0xFE @305419896 à T=100,200 ns",
        data_list = DataList([Data(
            addr = 305419896,
            data = bytearray(int(0xFE).to_bytes(1, 'big')),
            ends_with_tlast = True,
            dformat = DataFormat(1)
        )])
    ),

    Stimuli(
        id_ = file + "_2",
        access = Access.READ,
        rel_time = Time(1, "ms"),
        data_list = DataList([Data.build_empty(
            addr = 0,
            length = 4096,
            ends_with_tlast = False,
            dformat = DataFormat(1)
        )])
    ),

    Stimuli(
        id_ = "TEST4",
        access = Access.READ,
        rel_time = Time(1, "ns"),
        desc = "exemple de lecture de 2 octets  @305419896 à T=1101,200 ns",
        data_list = DataList([Data.build_empty(
            addr = 305419896,
            length = 2,
            ends_with_tlast = False,
            dformat = DataFormat(1)
        )])
    ),

    Stimuli(
        id_ = "IMAGE_1",
        access = Access.WRITE,
        rel_time = Time(1, "ms"),
        desc = "envoie d'une image",
        data_list = DataList([Data(
            addr = 0x10001234,
            data = bytearray([0x12, 0x34, 0x56, 0x78, 0xAB, 0xCD, 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF]),
            ends_with_tlast = False,
            dformat = DataFormat(4)
        )])
    )
])



def test_stim_parsing():
    print("StimuliList parsing test started")

    print("Parsing stimuli file")
    stimlist = StimuliList.from_file(file + ".json")

    print("Testing against reference design")

    for i in range(len(reference_stimlist)):
        assert stimlist[i] == reference_stimlist[i], \
                "Stimuli nb {} is different from reference:\n{}\n{}".format(i, stimlist[i], reference_stimlist[i])

    print("StimuliList parsing test passed")


if __name__ == "__main__":
    test_stim_parsing()
