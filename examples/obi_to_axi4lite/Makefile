
TOPLEVEL_LANG = vhdl
VHDL_LIB_ORDER = ic_lib obi_utils
VHDL_SOURCES_obi_utils = $(PWD)/src/obi_pkg.vhd
VHDL_SOURCES = $(PWD)/src/obi_to_axi4lite.vhd
TOPLEVEL = obi_to_axi4lite
MODULE = "tests.write_read.main"

SIM = ghdl
COMPILE_ARGS = --std=08
SIM_ARGS = --vcd=wave.vcd --wave=wave.ghw

include $(shell cocotb-config --makefiles)/Makefile.sim
