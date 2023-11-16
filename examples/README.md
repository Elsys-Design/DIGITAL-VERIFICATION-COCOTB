

## Testbench examples

Note: These examples will be updated along with the framework.



### Quick tests description

#### Test generalities
For most tests, we verify the monitor logs (stimlogs directory) by comparing them to golden monitor logs that were
manually verified (golden\_stimlogs directory).
Hence, the monitor fonctionnality is tested in almost every tests.


There are 3 example DUTs:
#### interconnect
DUT: axi and axi-lite buses, an Axi Interconnect, an AXI DMA and some Axi Data Fifo  

##### AXI and AXI-Lite tests
- random\_stimuli: generates random stimulis and launches them from the python AXI and AXI-Lite masters
- special\_cases: tests special cases such as
    * AXI burst cutting using '!'
    * Fill json field
    * AXI transfer accross a 4k boundary

##### AXI DMA tests:
- dma\_copy: copies data from a cocotb ram to another by controlling the AXI DMA in the DUT

##### AXI RAM tests:
- ram\_from\_to\_file: tests the direct writting and reading to a cocotb ram (no axi transactions, just direct accesses
  from python)


#### interconnect\_stream
DUT: axi stream buses with an Axi Interconnect and Axi DWidth converter to have different bus sizes
(no tlast and no tkeep on all axi stream buses)  

##### Tests
- unit\_write\_read: tests unitary write and reads
- stimuli\_inputs: tests the execution of a scenario described as a stimuli file


#### interconnect\_stream\_tlast
DUT: same as interconnect\_stream but with a tlast and a tkeep signal on all axi stream buses  

##### Tests
- unit\_write\_read: tests unitary write and reads
- stimuli\_inputs: tests the execution of a scenario described as a stimuli file


### Structure
All testbench examples follow the same structure:
- block\_design.png: screenshot of the Vivado block design that represents the DUT
- address\_map.png: map of AXI addresses (not for interconnect\_stream since there is only AXI-Stream interfaces)
- src/: contains vhdl sources
- tests/: contains different tests directories (see 'Test directories' below)
- tb.py: the testbench. Its purpose it to avoid code duplication (see 'Testbench usage').
- inputs/: contains the input files for the tests.file\_inputs test
- Makefile: allows to
    * compile the design with GHDL using `make analyse`
    * run the tests listed in the Makefile's MODULE variable using `make`
    * run all tests in a file using `make MODULE=tests.testname`
- wave.ghw and wave.vcd: signal dump that can be opened with gtkwave. It contains all the tests launched durign the last
  run, each separated by a reset.
- results.xml contains the results of all the last tests launched

#### Test directories
Each test directory contains:
- main.py: the test script (the method called is the one decorated with `@cocotb.test()`)
- inputs/: if present, it contains handwritten data and/or stimuli files used as inputs in the test
- generated\_inputs/: if present, it contains randomly generated data and/or stimuli files used as inputs in the test
- stimlogs/: contains the monitor outputs, each directory contains the log of the monitor of the same name
- golden\_stimlogs/: stores manually checked monitor logs to be automatically compared with stimlogs/
    * for random tests, it contains directories named after the random seed used, all of which have contents similar
      to stimlogs/
    * for regular tests, it's directly like stimlogs/ but manually checked
- read\_data: present only for read tests, contains the data read
- golden\_read\_data: stores manually checked read data (with the same distinction as golden\_stimlogs for
  random tests)

#### Testbench usage
The constructor builds the testbench by connecting the framework's (or cocotbext-axi's) components to axi buses.  
Each test should build a testbench object to have a direct access to each attributes and methods directly in one line:
`tb = TB(dut)`.  
We can also put a reset method in the TB class to be able to call `tb.reset()` at any time during the test.  


### Compiling sources
Cocotb recompiles the DUT's VHDL design at every simulation (instead of only when the design changes)
(see https://github.com/cocotb/cocotb/issues/1527 and #20).  
A simple fix is to 
```
vim $(cocotb-config --makefiles)/simulators/Makefile.ghdl
```
and change the last target from:
```
$(COCOTB_RESULTS_FILE): analyse $(CUSTOM_SIM_DEPS)
```
to
```
$(COCOTB_RESULTS_FILE): $(CUSTOM_SIM_DEPS)
```

Once that is done, we can use `make analyse` to compile the design (from an example directory such as 'interconnect/').
With this solution, `make analyse` has to be called manually every time the design changes.

### Launching tests
`make` in an example directory (interconnect or interconnect\_stream for instance) will launch all the tests specified
in the Makefile's MODULE variable.  
`make MODULE=tests.dma_copy.main` will only launch the `dma\_copy` test.  
`make MODULE="tests.dma_copy.main, tests.file_write.main"` will only launch the `dma\_copy` and the `file\_write` tests.  

Note: Multiple tests launched at once will result in a single waveform with each test running separately.  
Since we reset the testbench at every test, we can separate them on the waveform with the reset signal.  


#### /!\ Inflexibility of automatic testing (could be improved ?)
Right now, most tests verify the monitors logs by comparing a golden\_stimlogs/ directory with a stimlogs/ directory.  
However, the monitors logs contain an `abs_time` field that depends on the time in the simulation.  
Moreover, the starting time of a test during a run depends on the ending time of previous tests during the same run.  
Hence, in order to get the same `abs_time` in the generated stimlogs/ and in the golden\_stimlogs/, **the tests order
must stay the same**.  
This order is the one in the Makefile's MODULE variable.  
