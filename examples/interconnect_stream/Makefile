
export PYTHONPATH := $(PWD):$(PYTHONPATH)

TOPLEVEL_LANG = vhdl
VHDL_SOURCES = $(PWD)/src/*
TOPLEVEL = design_1
MODULE = "tests.file_inputs"

SIM = ghdl
COMPILE_ARGS = -fsynopsys -P$(UNISIM_PATH)
SIM_ARGS = --wave=wave.ghw --vcd=wave.vcd


include $(shell cocotb-config --makefiles)/Makefile.sim
