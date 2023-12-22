

## File write test
For each master:
- generates a random DataList
- writes it to a file
- writes that DataList directly from the file using the AxiMaster/AxiLiteMaster write\_data\_from\_file method

At the end of the test, we:
- write the monitor logs in the stimlogs/ directory
- compare the read\_data and the stimlogs with the golden ones and throw a TestFailure exception if they differ
