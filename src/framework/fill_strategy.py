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
    def exec_on(strategy, barray, len_toadd):
        """
        Adds len_toadd bytes to barray according to the strategy parameter.
        """
        assert len_toadd >= 0, "len_toadd parameter must be >= 0"

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
        Generates a custom seed.
        Seeds < 2 are not valid custom seeds.
        Note: we're using the current random state to generate this seed.
        """
        return random.randint(2, 10**6)
