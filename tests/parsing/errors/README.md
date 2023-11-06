

## Error tests

These tests verify that the parsing methods don't let a badly formatted file be parsed without raising an exception.

All the test files should be badly formatted and the single main.py test verifies that parsing each file results in an
exception.

**Note**: Right now, we don't verify which exception is thrown which makes these tests a little weak.
The exceptions for each tests are printed to stdout when launching the test directly (without pytest).


### TODO
Stimuli files parsing needs to be tested for errors too

