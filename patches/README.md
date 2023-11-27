

## Patches to cocotbext.axi

### AXI bus with no id
cocotbext.axi considers that all AXI buses have id signals (awid, bid, arid, rid).
However, these signals are optional in the AXI specification.
Support for AXI buses with no ids is implemented in framework.buses.AxiBus by adding dummy id fields.

### AXI3 (limited?) support
AXI3 buses aren't supported by cocotbext.axi since the library verifies the size of all signals before accepting them.
Sizes differences between AXI4 and AXI3:
| Signals       | AXI3 size | AXI4 size |
|---------------|-----------|-----------|
| awlen/arlen   | 4 bits    | 8 bits    |
| awlock/arlock | 2 bits    | 1 bit     |

To make it work, we just need to remove the verification of the size for these signals.
The `cocotbext-axi_AXI3.patch` file in this directory explains the patch to apply to cocotbext.axi.
It can be applied with:
```
patch -ruN -d path/to/oss-cad-suite/lib/python3.8/site-packages/cocotbext/axi < cocotbext-axi_AXI3.patch
```

**Note:** This patch is extremely limited since it only removes some verifications.
Hence, all the testbenches that worked before should still work.
However, it the support for AXI3 buses hasn't been properly tested yet.

