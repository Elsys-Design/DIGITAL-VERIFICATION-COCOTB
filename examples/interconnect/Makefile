
export PYTHONPATH := $(PWD):$(PYTHONPATH)

TOPLEVEL_LANG = vhdl
VHDL_SOURCES = $(PWD)/src/*
TOPLEVEL = design_1
MODULE = "tests.file_inputs, tests.unit_write"

SIM = ghdl
COMPILE_ARGS = -fsynopsys -fexplicit -P../../../vivado_lib/compiled_unisim/unisim/v93/
SIM_ARGS = --wave=wave.ghw --vcd=wave.vcd

include $(shell cocotb-config --makefiles)/Makefile.sim
