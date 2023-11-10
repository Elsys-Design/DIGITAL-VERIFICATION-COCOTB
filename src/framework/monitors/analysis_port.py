



class AnalysisPort:
    """
    Analysis ports belong to monitors and any function or method can be connected to them.
    Monitors send stimulis through this port when they receive one.
    """

    def __init__(self):
        self.subscribers = []

    def subscribe(self, function):
        self.subscribers.append(function)

    def send(self, stimuli):
        for s in self.subscribers:
            s(stimuli)

