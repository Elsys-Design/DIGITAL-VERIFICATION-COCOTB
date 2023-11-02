import sys
import json
import filecmp

from framework.data import Data, DataFormat
from framework.data_list import DataList
from framework.stimuli import Stimuli, Access
from framework.stimuli_list import StimuliList
from framework.fill_strategy import FillStrategy
from framework.time import Time


file = "0"

print_stimlist = StimuliList([
    Stimuli(
        _id = file + "_0",
        access = Access.WRITE,
        rel_time = Time(100, "ps"),
        abs_time = Time(100, "ps"),
        data_list = DataList([Data(
            addr = 0x12345678,
            data = bytearray(int(125).to_bytes(4, 'big')),
            stream_tlast_end = True,
            data_format = DataFormat(4)
        )])
    ),

    Stimuli(
        _id = "TEST2",
        access = Access.WRITE,
        rel_time = Time(100.1, "ns"),
        abs_time = Time(100.2, "ns"),
        desc = "exemple d'écriture de 1 octet 0xFE @305419896 à T=100,200 ns",
        data_list = DataList([Data(
            addr = 305419896,
            data = bytearray(int(0xFE).to_bytes(1, 'big')),
            stream_tlast_end = True,
            data_format = DataFormat(4)
        )])
    ),

    Stimuli(
        _id = file + "_2",
        access = Access.READ,
        rel_time = Time(1, "us"),
        abs_time = Time(1100.2, "ns"),
        data_list = DataList([Data(
            addr = 0,
            data = bytearray([0xAB] * 64),
            stream_tlast_end = False,
            data_format = DataFormat()
        )])
    ),

    Stimuli(
        _id = "TEST4",
        access = Access.READ,
        rel_time = Time(1, "ns"),
        abs_time = Time(1101.2, "ns"),
        desc = "exemple de lecture de 2 octets  @305419896 à T=1101,200 ns",
        data_list = DataList([Data(
            addr = 305419896,
            data = bytearray([0xCD] * 2),
            stream_tlast_end = False,
            data_format = DataFormat(4)
        )])
    ),

    Stimuli(
        _id = "IMAGE_1",
        access = Access.WRITE,
        rel_time = Time(1, "us"),
        abs_time = Time(2101.2, "ns"),
        desc = "envoie d'une image",
        data_list = DataList([Data(
            addr = 0x10001234,
            data = bytearray([0x12, 0x34, 0x56, 0x78, 0xAB, 0xCD, 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF]),
            stream_tlast_end = False,
            data_format = DataFormat(4)
        )])
    )
])


print_stimlist.write_to_dir("tmp")

cmp = filecmp.dircmp("tmp", "reference")

cmp.report()


