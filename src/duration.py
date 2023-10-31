import math


class Duration:

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

    def __init__(self, value, unit):
        if unit not in self.supported_units:
            raise ValueError("{} unit isn't supported (supported units: {})".format(unit, *self.supported_units))

        self.value = float(value) * self.supported_units[unit]


    def __str__(self):
        val = self.value
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


