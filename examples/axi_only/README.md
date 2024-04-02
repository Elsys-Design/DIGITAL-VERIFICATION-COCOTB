
## Quick tests description
All the examples in this directory use with AXI(-lite/-stream) interfaces.
Note: all example DUTs are not described here.

### Test generalities
There are 3 main example DUTs (interconnect, interconnect\_stream and interconnect\_stream\_tlast).
There is also 2 example DUTs that change only the bus sizes (sizes/interconnect and sizes/interconnect\_stream\_tlast).

### interconnect
DUT: axi and axi-lite buses, an Axi Interconnect, an AXI DMA and some Axi Data Fifo  

#### AXI and AXI-Lite tests
- random\_stimuli: generates random stimulis and launches them from the python AXI and AXI-Lite masters
- special\_cases: tests special cases such as
    * AXI burst cutting using '!'
    * Fill json field
    * AXI transfer accross a 4k boundary

#### AXI DMA tests:
- dma\_copy: copies data from a cocotb ram to another by controlling the AXI DMA in the DUT

#### AXI RAM tests:
- ram\_from\_to\_file: tests the direct writting and reading to a cocotb ram (no axi transactions, just direct accesses
  from python)


### interconnect\_stream
DUT: axi stream buses with an Axi Interconnect and Axi DWidth converter to have different bus sizes
(no tlast and no tkeep on all axi stream buses)  

#### Tests
- unit\_write\_read: tests unitary write and reads
- stimuli\_inputs: tests the execution of a scenario described as a stimuli file
- file\_write\_read: tests write from file and read to file using random inputs


### interconnect\_stream\_tlast
DUT: same as interconnect\_stream but with a tlast and a tkeep signal on all axi stream buses  

#### Tests
- unit\_write\_read: tests unitary write and reads
- stimuli\_inputs: tests the execution of a scenario described as a stimuli file
- file\_write\_read: tests write from file and read to file using random inputs

