import logging
import logging.config
import os


framework_dir = os.path.dirname(os.path.realpath(__file__))
#logging.config.fileConfig(os.path.join(framework_dir, "default_logger.conf"), disable_existing_loggers = False)
logger = logging.getLogger("framework")
