

## Error tests

These tests verify that the parsing methods don't let a badly formatted file be parsed without raising an exception.

All the test files should be badly formatted and the single main.py test verifies that parsing each file results in an
exception.

The exceptions for each tests are logged in the "log" file.
The log file is compared with the "golden\_log" file after each execution to verify the right exceptions were thrown for
each test.

