import logging
import logging.config
import os


framework_dir = os.path.dirname(os.path.realpath(__file__))
logging.config.fileConfig(os.path.join(framework_dir, "default_logger.conf"))
logger = logging.getLogger("framework")
