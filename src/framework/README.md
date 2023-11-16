

## Framework package

### Data structures
#### StimuliList
It's a list of Stimuli with a few specific methods to parse from / write to a directory.  
It represents a whole stimuli.json file.  

#### Stimuli
It represents a single json object in a stimuli.json file.  
It contains a single DataList.  

#### DataList
It's a list Data with a few specific methods to parse from / write to a file.  
It represents a whole data.dat file.  
Note: More often than not, a DataList contains only a single Data item.
This class exists mostly to handle special cases like parsing or reading from an AxiStreamSink.  

#### Data
It represents a single (simple) sequence in a data.dat file.  
Note: a parsed sequence may end up being multiple Data objects since Data objects are more restrictive than parsed
sequences (if there is a tlast ('!') in the middle of a sequence, we'll have a first Data object ending with a tlast and
then another for the rest of the sequence).  


### Specific structures
#### Time
Time is just a custom class to properly represent time.
Note: It could become a static class with methods that take a single int representing the time in the simulator's unit.

#### FillStrategy
Simplifies handling of the 'Fill' field in Stimuli json objects.


### Custom logger
The custom logger takes cocotb's formatter but changes the handler to print everything to a framework.log file.
All framework loggers should inherit from the 'framework' logger.
Note: It could eventually use a different formatter to have access to the line of the log.


### TODO


### To improve

#### Error reporting
- uses base python exceptions for now so messages are not printed in the custom logger
- doesn't report the line number for parsing errors (for data the line number could be reported and for stimulis we could
  report the whole stimuli object)
