

## Unitary tests

### Automatic tests
Most tests are self checking.  
They can be launched with pytest: `python3.8 -m pytest` in this directory launches all automatic tests.  
`python3.8 -m pytest parsing` will launch all tests under the `parsing` directory.

#### Fixtures
Launching these tests without pytest won't work because there are 2 fixtures in conftest.py (a fixture is a function
that is called before executing any test to prepare the test environment):
- The first one changes the current directory to the test's directory.
This allows to have all test files near the script.
- The second deactivates the logs.
The framework's loggers use a format containing the simulation time but since there is no simulator (because the tests
are launched without any DUT), we cannot use it.
Another solution would be to change the logger's formatter to still have access to the framework's custom logs.

### Manual tests
- Manual tests are scripts that print their outputs.
They are not self checking.

