
## Testbench examples
Note: These examples will be updated along with the framework.

## Directory structure
- [axi_only/](axi_only/) contains tests for DUTs with axi interfaces
- [obi_only/](obi_only/) contains tests for DUTs with obi interfaces
- some DUTs have axi and obi interfaces, they can be found directly in this
directory (ex: [obi_to_axi4lite/](obi_to_axi4lite/)).

## Launching tests
`make` in a test directory ([axi_only/simple/](axi_only/simple/) for instance)
will launch all the tests specified in the Makefile's MODULE variable.  
`make MODULE=tests.dma_copy.main` will only launch the `dma\_copy` test.  
`make MODULE="tests.dma_copy.main, tests.file_write.main"` will only launch the
`dma\_copy` and the `file\_write` tests.  

Note: Multiple tests launched at once will result in a single waveform with each
test running separately.  
Since we reset the testbench at the beginning of every test, we can separate
them on the waveform with the reset signal.  


## Testbench description

### Structure
Each example testbench follows the same structure:
- `block\_design.png`: screenshot of the Vivado block design that represents the
DUT
- `address\_map.png`: map of AXI addresses (not for interconnect\_stream since
there is only AXI-Stream interfaces)
- `src/`: contains vhdl sources
- `tests/`: contains different tests directories (see 'Test directories' below)
- `tb.py`: the testbench. Its purpose it to avoid code duplication
(see [Testbench](#testbench)).
- `inputs/`: contains the input files for the tests.file\_inputs test
- `Makefile`: allows to
    * compile the design with GHDL using `make analyse`
    * run the tests listed in the Makefile's MODULE variable using `make`
    * run all tests in a file using `make MODULE=tests.testname`  
Note: [base.make](base.make) is included in every Makefile and contains generic
declarations.
- `wave.ghw` and `wave.vcd`: signal dump that can be opened with gtkwave. It
contains all the tests launched durign the last run, each separated by a reset.
- `results.xml` contains the results of all the last tests launched

#### Test directories
Each test directory contains:
- `main.py`: the test script (the method called is the one decorated with
`@cocotb.test()`)
- `inputs/`: if present, it contains handwritten data and/or stimuli files used
as inputs in the test
- `generated\_inputs/`: if present, it contains randomly generated data and/or
stimuli files used as inputs in the test
- `stimlogs/`: contains the monitor outputs, each directory contains the log of
the monitor of the same name
- `golden\_stimlogs/`: stores manually checked monitor logs to be automatically
compared with `stimlogs/`
    * for random tests, it contains directories named after the random seed
    used, all of which have contents similar to `stimlogs/`
    * for regular tests, it's directly like `stimlogs/` but manually checked
- `read\_data`: present only for read tests, contains the data read
- `golden\_read\_data/`: stores manually checked read data (with the same
distinction as `golden\_stimlogs/` for random tests)

### Testbench
The testbench's constructor builds the testbench by connecting the framework's
components to the axi interfaces on the DUT.  
Each test should build a testbench object to have a direct access to each
attributes and methods directly.  
This is done in one line: `tb = TB(dut)`.  
We can also put a reset method in the TB class to be able to call `tb.reset()`
at any time during the test (usually at least at the beginning of each test).  

### Verification
For most tests, we verify the monitor logs (in `stimlogs`) by comparing
them to golden monitor logs that were manually verified
(in `golden\_stimlogs/`).
Hence, the monitor fonctionnality is tested in almost every tests.



## /!\ Inflexibility of automatic testing (could be improved ?)
Right now, most tests verify the monitors logs by comparing a
`golden\_stimlogs/` directory with a `stimlogs/` directory.  
However, the monitors logs contain an `abs_time` field that depends on the time
in the simulation.  
Moreover, the starting time of a test during a run depends on the ending time of
previous tests during the same run.  
Hence, in order to get the same `abs_time` in the generated `stimlogs/` and in
the `golden\_stimlogs/`, **the tests order must stay the same**.  
This order is the one in the Makefile's `MODULE` variable.  
