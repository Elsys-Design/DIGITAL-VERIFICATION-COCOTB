import logging
from cocotb.log import SimTimeContextFilter, SimLogFormatter


# Note: To change the logging level: logger.setLevel(logging.INFO)
# can be done at the beginning of a testbench constructor or at the beginning of a test (or anywhere else)


# Getting custom logger
logger = logging.getLogger("framework")

# Undo the setup cocotb did on the root logger that the framework's logger inherited
for handler in logger.handlers:
    logger.removeHandler(handler)
    handler.close()

# Don't propagate to parent
logger.propagate = False


# Building the handler up just like in "https://github.com/cocotb/cocotb/blob/master/src/cocotb/log.py#L81"
# except it's a FileHandler and not a StreamHandler
hdlr = logging.FileHandler("framework.log", mode="w")
hdlr.addFilter(SimTimeContextFilter())
hdlr.setFormatter(SimLogFormatter())

# Set handler
logger.addHandler(hdlr)

# Set default level
logger.setLevel(logging.INFO)
