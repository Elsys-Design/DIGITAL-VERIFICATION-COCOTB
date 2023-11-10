
export PYTHONPATH := $(PWD):$(PYTHONPATH)

TOPLEVEL_LANG = vhdl
VHDL_SOURCES = $(PWD)/src/*
TOPLEVEL = design_1
MODULE = "tests.stimulis_inputs.main, tests.file_write_read.main"

SIM = ghdl
COMPILE_ARGS = -fsynopsys -P$(UNISIM_PATH)
SIM_ARGS = --wave=wave.ghw --vcd=wave.vcd

export RANDOM_SEED = 123456789

include $(shell cocotb-config --makefiles)/Makefile.sim
