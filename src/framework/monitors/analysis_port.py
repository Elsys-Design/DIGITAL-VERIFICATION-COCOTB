from typing import Callable

from ..stimuli import Stimuli


class AnalysisPort:
    """
    Analysis ports belong to monitors and any function or method can be connected to them.
    Monitors send stimulis through this port when they receive one.

    Attributes:
        subscribers: list of Callable[Stimuli] that contains all the callbacks to call when a stimuli is received.
    """

    def __init__(self) -> None:
        self.subscribers = []

    def subscribe(self, function: Callable[[Stimuli], None]) -> None:
        self.subscribers.append(function)

    def send(self, stimuli: Stimuli) -> None:
        for s in self.subscribers:
            s(stimuli)
