
TOPLEVEL_LANG = vhdl
VHDL_LIB_ORDER = ic_lib obi_utils
VHDL_SOURCES_ic_lib = $(PWD)/src/ic_pkg.vhd
VHDL_SOURCES_obi_utils = $(PWD)/src/obi_pkg.vhd $(PWD)/src/obi_addr_translator.vhd
VHDL_SOURCES = $(PWD)/src/top.vhd
TOPLEVEL = top
MODULE = "tests.write_read.main, tests.atomic_write_read.main"

SIM = ghdl
COMPILE_ARGS = --std=08
SIM_ARGS = --vcd=wave.vcd --wave=wave.ghw

#SIM = modelsim
#COMPILE_ARGS = -2008
#SIM_ARGS = ""

include $(shell cocotb-config --makefiles)/Makefile.sim
