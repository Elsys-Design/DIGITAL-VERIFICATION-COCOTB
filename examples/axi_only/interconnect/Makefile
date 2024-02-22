

TOPLEVEL_LANG = vhdl
VHDL_SOURCES = $(PWD)/src/*
TOPLEVEL = design_1
MODULE = "$\
	tests.dma_copy.main,$\
	tests.file_write.main,$\
	tests.file_read.main,$\
	tests.ram_from_to_file.main,$\
	tests.random_stimulis.main,$\
	tests.special_cases.main$\
"

SIM = ghdl
COMPILE_ARGS = -fsynopsys -fexplicit -P$(UNISIM_PATH)
SIM_ARGS = --wave=wave.ghw --vcd=wave.vcd

# Fixes the result file for all tests with an ABSOLUTE PATH
# default is just results.xml so when we change to the test's directory at the beginning of each test, the path changes
COCOTB_RESULTS_FILE = $(PWD)/results.xml

export RANDOM_SEED = 123456789

include $(shell cocotb-config --makefiles)/Makefile.sim
