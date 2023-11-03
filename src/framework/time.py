

class Time(int):
    """
    Represents a Time as a single value in fs (=10**(-15) s).
    It can be constructed using a value and an unit.

    Note: min and hr units aren't supported yet.
    """

    supported_units = {
            "fs" : 1,
            "ps": 10**3,
            "ns": 10**6,
            "us": 10**9,
            "ms": 10**12,
            "sec": 10**15,
            #"min": 60*10**15,
            #"hr": 60*60*10**15
            }

    def __new__(cls, value : float, unit : str, *args, **kwargs):
        if value < 0:
            raise ValueError("Time value cannot be less than zero")

        if unit not in cls.supported_units:
            raise ValueError("{} unit isn't supported (supported units: {})".format(unit, *cls.supported_units))

        return super(cls, cls).__new__(cls, round(value * cls.supported_units[unit]))


    def __str__(self):
        val = self
        ten_power = 0
        # Find the actual precision
        while val % 10 == 0:
            val /= 10
            ten_power += 1

        # Move the power until finding a good unit
        float_pow = 3 - ten_power % 3
        # Actualise the value and the power
        val /= 10**float_pow
        ten_power += float_pow

        # Printing format
        return "{:.3f} {}".format(val, list(self.supported_units.keys())[ten_power//3])
