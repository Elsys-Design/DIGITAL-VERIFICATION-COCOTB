
include ../base.make

VHDL_LIB_ORDER = obi_utils
VHDL_SOURCES_obi_utils = $(PWD)/src/obi_pkg.vhd
VHDL_SOURCES = $(PWD)/src/obi_to_axi4lite.vhd
TOPLEVEL = obi_to_axi4lite

COMPILE_ARGS += --std=08

MODULE = "tests.write_read.main"

include $(shell cocotb-config --makefiles)/Makefile.sim
