import sys
import json
import logging

from framework import DataList, StimuliList, FillStrategy, logger

logger.setLevel(logging.CRITICAL + 1)

stimlist = StimuliList.from_file(sys.argv[1])

stimlist.write_to_dir("outputs")
