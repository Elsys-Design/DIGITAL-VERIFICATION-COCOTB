

## AXI3 Interconnect testbench with no id signals
To make this testbench run, the `cocotbext-axi_AXI3_and_NOID.patch` (it's in the top dir of the git repo)
must be applied to the cocotbext/axi/ directory of the cocotbext-axi library:
```
patch -ruN -d path/to/oss-cad-suite/lib/python3.8/site-packages/cocotbext/axi < path/to/cocotbext-axi_AXI3_and_NOID.patch
```


