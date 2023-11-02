import sys
import json
from framework.data import Data, DataFormat
from framework.data_list import DataList
from framework.stimuli import Stimuli, Access
from framework.stimuli_list import StimuliList
from framework.fill_strategy import FillStrategy
from framework.time import Time


file = "0"

reference_stimlist = StimuliList([
    Stimuli(
        _id = file + "_0",
        access = Access.WRITE,
        rel_time = Time(100, "ps"),
        desc = "exemple d'écriture de 4 octets 125  @0x12345678 à T=100 ps",
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
        rel_time = Time(1, "ms"),
        data_list = DataList([Data(
            addr = 0,
            data = bytearray([0] * 4096),
            stream_tlast_end = False,
            data_format = DataFormat()
        )])
    ),

    Stimuli(
        _id = "TEST4",
        access = Access.READ,
        rel_time = Time(1, "ns"),
        desc = "exemple de lecture de 2 octets  @305419896 à T=1101,200 ns",
        data_list = DataList([Data(
            addr = 305419896,
            data = bytearray([0] * 2),
            stream_tlast_end = False,
            data_format = DataFormat(4)
        )])
    ),

    Stimuli(
        _id = "IMAGE_1",
        access = Access.WRITE,
        rel_time = Time(1, "ms"),
        desc = "envoie d'une image",
        data_list = DataList([Data(
            addr = 0x10001234,
            data = bytearray([0x12, 0x34, 0x56, 0x78, 0xAB, 0xCD, 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF]),
            stream_tlast_end = False,
            data_format = DataFormat(4)
        )])
    )
])


stimlist = StimuliList.from_file("0.json")

for i in range(len(reference_stimlist)):
    assert stimlist[i] == reference_stimlist[i], \
            "Stimuli nb {} is different from reference:\n{}\n{}".format(i, stimlist[i], reference_stimlist[i])



