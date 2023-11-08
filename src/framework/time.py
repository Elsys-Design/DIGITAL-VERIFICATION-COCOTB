from cocotb.utils import get_sim_time, get_sim_steps
from cocotb.triggers import Timer
import cocotb


class Time:
    """
    Represents a Time as a single value in simulator step.
    It can be constructed using a value and an unit.

    Note: min and hr units aren't supported yet.
    """
    scale = {
            -15: 'fs',
            -12: 'ps',
            -9:  'ns',
            -6:  'us',
            -3:  'ms',
            0:   'sec'
    }


    def __init__(self, value : float, unit : str):
        if value < 0:
            raise ValueError("Time value cannot be less than zero")

        if unit not in self.scale.values():
            raise ValueError("{} unit isn't supported (supported units: {})".format(unit, *self.scale.values()))

        self.value = cocotb.utils.get_sim_steps(value, unit, round_mode="round")

    async def wait(self):
        await Timer(self.value, units='step', round_mode="round")

    def __str__(self):
        val = self.value
        ten_power = cocotb.utils._get_simulator_precision()
        # Find the actual precision
        if val != 0:
            while val % 10 == 0:
                val /= 10
                ten_power += 1

        # Move the power until finding a good unit
        float_pow = 3 - ten_power % 3
        # Actualise the value and the power
        val /= 10**float_pow
        ten_power += float_pow

        # Printing format
        return "{:.3f} {}".format(val, self.scale[ten_power])

    def full_str(self):
        return "{:d} {}".format(self.value, self.scale[cocotb.utils._get_simulator_precision()])


    @classmethod
    def now(cls):
        return cls(get_sim_time('fs'), 'fs')


    def __add__(self, other):
        return Time(self.value + other.value, 'fs')

    def __sub__(self, other):
        return Time(self.value - other.value, 'fs')

    def __eq__(self, other):
        return self.value == other.value
