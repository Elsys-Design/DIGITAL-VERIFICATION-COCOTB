
import pytest


# Set fixture to all tests
@pytest.fixture(autouse=True)
def change_test_dir(request, monkeypatch):
    """
    This fixture changes the current python directory to the one containing the test script being executed
    This makes it much easier to access files in the directory of the script and is used for all tests (autouse=True)
    """
    monkeypatch.chdir(request.fspath.dirname) 

