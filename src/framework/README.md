

## Framework package

### TODO
- AxiStreamSink should be reimplemented (\_run method only) to handle the tready as needed
    Current cocotbext.axi.AxiStreamSink always puts it to True unless a pause is set (but we still can't get the data
until a tlast has arrived)



### To improve

#### Error reporting
- uses base python exceptions for now so messages are not printed in the custom logger
- doesn't report the line number for parsing errors (for data the line number could be reported and for stimulis we could
  report the whole stimuli object)
