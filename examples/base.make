#!/bin/make

TOPLEVEL_LANG ?= vhdl
VHDL_SOURCES ?=  ./src/*

TOPLEVEL ?= design_1

SIM ?= ghdl
ifeq ($(SIM), nvc)
    COMPILE_ARGS ?= --std=08
    SIM_ARGS ?= --format=fst --wave=wave.fst
    EXTRA_ARGS ?= -M100m
else ifeq ($(SIM), ghdl)
    COMPILE_ARGS ?= --std=08 -fsynopsys -fexplicit -P$(GHDL_UNISIM_PATH)
    SIM_ARGS ?= --wave=wave.ghw --vcd=wave.vcd
else
    $(error \
        Only nvc and ghdl are supported for now. Adding support for a cocotb \
        compatible simulator is as simple as adding a case in the code above. \
    )
endif

# Fixes the result file for all tests with an ABSOLUTE PATH
# default is just results.xml so when we change to the test's directory at the beginning of each test, the path changes
COCOTB_RESULTS_FILE = $(PWD)/results.xml

export RANDOM_SEED = 123456789

include $(shell cocotb-config --makefiles)/Makefile.sim
