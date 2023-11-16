

## Stimuli tests

These tests verify the parsing and printing of Stimuli(List)s.
Since a printed Stimuli isn't one that is valid to parse again, we cannot do random generate -> print -> parse tests
like was done for the Data(List) tests.

Each test works on only one StimuliList because the StimuliList behaviour isn't what is tested (it's a simple list both
in python and in json).
Stimuli parsing and printing is tested and we can add tests simply by specifying more Stimuli in the StimuliList.

### Parsing tests
Parsing tests parse a handwritten JSON file into a StimuliList and compare it with a StimuliList manually initialised in
python (the reference).


### Printing tests
Printing tests print a StimuliList that was manually initialised in python and write it to a directory.
They then compare this directory with a reference directory in which the files where handwritten.


### TODO
Add more stimuli (more testcases) in printing and in parsing tests.


