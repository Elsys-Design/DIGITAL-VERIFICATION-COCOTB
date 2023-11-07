

## Framework package

### TODO
#### AxiStreamSink
AxiStreamSink should be reimplemented (\_run method only) to handle the tready as needed:
Current cocotbext.axi.AxiStreamSink always puts it to True unless a pause is set (but we still can't get the data
until a tlast has arrived).
For now, we only read frames (everything until a tlast).
The only parameter the AxiStreamSink.read\_data() method needs is a length (address is useless) and the output can
be many datas if there is one or multiple tlast during the read.
For now, read data is only accessible through the monitors so this is not a problem (the method doesn't have to
return any of the received data).
If we wanted to return the read data, this changes the behaviour for this component which makes it harder to
integrate with the others (who have only read\_data(data) and write\_data(data) methods).
We could add read\_datalist() (and write\_datalist() ?) and only use these methods (this is the general case, with
most calls using a DataList with only one Data).



### To improve

#### Error reporting
- uses base python exceptions for now so messages are not printed in the custom logger
- doesn't report the line number for parsing errors (for data the line number could be reported and for stimulis we could
  report the whole stimuli object)
