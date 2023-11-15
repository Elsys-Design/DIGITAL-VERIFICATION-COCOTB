
## Drivers
This directory defines the framework's drivers.
They are just wrappers to cocotbext.axi's drivers (except AxiStreamSink) and allow to handle Data objects.


### AxiStreamSink
AxiStreamSink has been reimplemented to handle the tready as needed:
Current cocotbext.axi.AxiStreamSink always puts it to True unless a pause is set (but we still can't get the data
until a tlast has arrived).

The only parameter the AxiStreamSink.read\_data() method needs is a length (address is useless) and the output is a
DataList because there may be one or multiple tlast during the read.


