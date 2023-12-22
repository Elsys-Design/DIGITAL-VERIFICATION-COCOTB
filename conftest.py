
import pytest
import logging

from framework import logger


# Sets fixture to all tests
@pytest.fixture(autouse=True)
def change_test_dir(request, monkeypatch):
    """
    This fixture changes the current python directory to the one containing the test script being executed
    This makes it much easier to access files in the directory of the script and is used for all tests (autouse=True)
    """
    monkeypatch.chdir(request.fspath.dirname) 


# Sets fixture to all tests
@pytest.fixture(autouse=True)
def disable_logging(request):
    """
    This fixture disables logging.
    This is needed because the logs needs the simulation time and try to access the simulator (which doesn't exist) to
    get it.
    """
    logger.setLevel(logging.CRITICAL + 1)

