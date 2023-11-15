import logging


# Note: To change the logging level: logger.setLevel(logging.INFO)
# can be done at the beginning of a testbench constructor or at the beginning of a test (or anywhere else)

# We just create a framework logger
# and remove every handler inherited from cocotb (which modifies the root logger)
# We can then set our own handler and the default logging level

logger = logging.getLogger("framework")
logger.propagate = False

# undo the setup cocotb did
for handler in logger.handlers:
    logger.removeHandler(handler)
    handler.close()

_handler = logging.FileHandler("framework.log", mode='w')
logger.addHandler(_handler)
logger.setLevel(logging.DEBUG)
