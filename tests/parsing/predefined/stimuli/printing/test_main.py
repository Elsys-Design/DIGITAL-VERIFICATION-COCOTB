import sys
import os
import json
import filecmp

from framework import Data, DataFormat, DataList, Stimuli, Access, StimuliList, Time


file = "stimulis"


print_stimlist = StimuliList([
    Stimuli(
        id_ = file + "_0",
        access = Access.WRITE,
        rel_time = Time(100, "ps"),
        abs_time = Time(100, "ps"),
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
        abs_time = Time(100.2, "ns"),
        desc = "exemple d'écriture de 1 octet 0xFE @305419896 à T=100,200 ns",
        data_list = DataList([Data(
            addr = 305419896,
            data = bytearray(int(0xFE).to_bytes(1, 'big')),
            ends_with_tlast = True,
            dformat = DataFormat(4)
        )])
    ),

    Stimuli(
        id_ = file + "_2",
        access = Access.READ,
        rel_time = Time(1, "us"),
        abs_time = Time(1100.2, "ns"),
        data_list = DataList([Data(
            addr = 0,
            data = bytearray([0xAB] * 64),
            ends_with_tlast = False,
            dformat = DataFormat()
        )])
    ),

    Stimuli(
        id_ = "TEST4",
        access = Access.READ,
        rel_time = Time(1, "ns"),
        abs_time = Time(1101.2, "ns"),
        desc = "exemple de lecture de 2 octets  @305419896 à T=1101,200 ns",
        data_list = DataList([Data(
            addr = 305419896,
            data = bytearray([0xCD] * 2),
            ends_with_tlast = False,
            dformat = DataFormat(4)
        )])
    ),

    Stimuli(
        id_ = "IMAGE_1",
        access = Access.WRITE,
        rel_time = Time(1, "us"),
        abs_time = Time(2101.2, "ns"),
        desc = "envoie d'une image",
        data_list = DataList([Data(
            addr = 0x10001234,
            data = bytearray([0x12, 0x34, 0x56, 0x78, 0xAB, 0xCD, 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF]),
            ends_with_tlast = False,
            dformat = DataFormat(4)
        )])
    )
])



def test_stim_printing():
    print("StimuliList print test started")

    print("Writting stimuli list")
    print_stimlist.write_to_dir("tmp")

    print("Comparing directories, result :\n", "-"*10, sep="")
    dcmp = filecmp.dircmp("tmp", "reference")

    dcmp.report()
    print("-"*10)

    assert not dcmp.diff_files, "Some files differ between tmp and reference directories:\n{}".format(dcmp.diff_files)
    assert not dcmp.left_only, "StimuliList.write_to_dir generates the following unknown files:\n{}".format(dcmp.left_only)
    assert not dcmp.right_only, "StimuliList.write_to_dir doesn't generate the following files:\n{}".format(dcmp.right_only)

    print("StimuliList print test passed")




if __name__ == "__main__":
    test_stim_printing()
