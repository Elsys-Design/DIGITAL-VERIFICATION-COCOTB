
include ../../base.make

VHDL_LIB_ORDER = ic_lib obi_utils
VHDL_SOURCES_ic_lib = $(PWD)/src/ic_pkg.vhd
VHDL_SOURCES_obi_utils = $(PWD)/src/obi_pkg.vhd $(PWD)/src/obi_addr_translator.vhd
VHDL_SOURCES = $(PWD)/src/top.vhd
TOPLEVEL = top

COMPILE_ARGS += --std=08

MODULE = "$\
    tests.write_read.main,$\
    tests.atomic_write_read.main,$\
    tests.little_write_read.main$\
"

include $(shell cocotb-config --makefiles)/Makefile.sim
