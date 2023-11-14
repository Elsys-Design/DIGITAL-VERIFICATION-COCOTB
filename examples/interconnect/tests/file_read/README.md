

## File read test
For each master:
- generates a random DataList
- uses that DataList to execute read transactions using the AxiMaster and AxiLiteMaster
- writes the read data directly in a file in the read\_data/ directory

At the end of the test, we:
- write the monitor logs in the stimlogs/ directory
- compare the read\_data and the stimlogs with the golden ones and throw a TestFailure exception if they differ
