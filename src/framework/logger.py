import logging



logger = logging.getLogger("framework")
logger.propagate = False

# undo the setup cocotb did
for handler in logger.handlers:
    logger.removeHandler(handler)
    handler.close()

_handler = logging.FileHandler("framework.log", mode='w')
logger.addHandler(_handler)
logger.setLevel(logging.DEBUG)
