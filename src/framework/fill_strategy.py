import random



class FillStrategy:
    """
    Helper that represents a fill strategy as a int and can execute it on a bytearray.
    Namespace more than a class because it only contains class attributes & a static method.
    """
    RANDOM = -1
    ZEROS = 0
    ONES = 1

    @staticmethod
    def exec_on(strategy : 'FillStrategy', barray : bytearray, len_toadd : int) -> None:
        """
        Adds len_toadd bytes to barray according to the strategy parameter.
        
        Args:
            strategy: The fill strategy to adopt.
            barray: The bytearray to fill.
            len_toadd: The number of bytes to add at the end of barray using the strategy.

        Raises:
            ValueError: len_toadd is < than 0.
        """
        if len_toadd < 0:
            raise ValueError("len_toadd parameter must be >= 0")

        if strategy == FillStrategy.RANDOM:
            barray += bytearray(random.sample(range(0, 0xff), len_toadd))
        elif strategy == FillStrategy.ZEROS or strategy == FillStrategy.ONES:
            barray += bytearray([strategy*0xff] * len_toadd)
        else:
            # Same thing as strategy.RANDOM but we do it in a controlled random state
            rstate = random.getstate()
            random.seed(strategy)
            barray += bytearray(random.sample(range(0, 0xff), len_toadd))
            # restoring the old state so the rest of the simulation isn't impacted
            random.setstate(rstate)

    @staticmethod
    def generate_custom_seed():
        """
        Returns:
            A custom seed generated randomly using the current random state.
            This doesn't create seeds < 2 which are not valid custom seeds (but a defined FillStrategy).
        """
        return random.randint(2, 10**6)
