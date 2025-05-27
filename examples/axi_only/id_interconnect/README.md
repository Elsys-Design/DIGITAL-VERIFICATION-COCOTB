

## Simple AXI4 Interconnect testbench with id signals
This example is only here for the `id_interleaving` test.  
This test creates a situation where multiple transactions with different ids come from the same AxiMaster.  
The goal is to test the AxiBaseMonitor in these conditions.  

It uses the AxiMaster's `init_read` to launch 2 read at the same time:  
- First, it makes a very long read request (1000 bytes) that'll take time to complete.
- Then it makes a short read request (4 bytes) to another RAM.
The second read request is supposed to end first and with the right amount of data.  
