import sys
import logging

from framework import StimuliList, logger

logger.setLevel(logging.CRITICAL + 1)

stimlist = StimuliList.from_file(sys.argv[1])

stimlist.write_to_dir("outputs")
