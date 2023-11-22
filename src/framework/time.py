from cocotb.utils import get_sim_time, get_sim_steps
from cocotb.triggers import Timer
import cocotb


class Time:
    """
    Represents a Time as a single value in simulator step.
    It can be constructed using a value and an unit.

    Note: min and hr units aren't supported yet.

    Attributes:
        value: Time in the 'step' unit (the simulator's unit).
        scale: Class attribute that allows to get the unit name from a power of ten.
    """
    scale = {
            -15: 'fs',
            -12: 'ps',
            -9:  'ns',
            -6:  'us',
            -3:  'ms',
            0:   'sec'
    }


    def __init__(self, value : float, unit : str) -> None:
        """
        Args:
            value: Time value, must be positive.
            unit: Unit of the value parameter.

        Raises:
            ValueError: The value isn't positive or the unit isn't supported.
        """
        if value < 0:
            raise ValueError("Time value ({}) cannot be less than zero".format(value))

        if unit in self.scale.values():
            self.value = cocotb.utils.get_sim_steps(value, unit, round_mode="round")
        elif unit == 'step':
            self.value = value
        else:
            raise ValueError("{} unit isn't supported (supported units: {} + 'step')".format(unit, *self.scale.values()))

    @classmethod
    def now(cls) -> 'Time':
        """
        Returns:
            The current simulation time as a Time object.
        """
        return cls(get_sim_time('step'), 'step')


    async def wait(self) -> None:
        """
        Waits for the Time duration.
        """
        if self.value > 0:
            await Timer(self.value, units='step', round_mode="round")

    def __str__(self) -> str:
        """
        Returns:
            The Time with 3 digits after the decimal point and the highest unit possible.
        """
        val = self.value
        ten_power = cocotb.utils._get_simulator_precision()
        # Find the actual precision
        if val != 0:
            while val % 10 == 0:
                val /= 10
                ten_power += 1

        # Move the power again to get to the nearest bigger unit
        # Since units are separated by a 10**3 factor, we know that we won't have the smallest non-zero digit further
        # than at 10**-3
        float_pow = 3 - ten_power % 3
        val /= 10**float_pow

        ten_power += float_pow

        # Printing format
        return "{:.3f} {}".format(val, self.scale[ten_power])

    def full_str(self) -> str:
        """
        Returns:
            The Time in the simulator unit.

        Precision that isn't a plain unit (ex: 100fs) isn't supported.
        This isn't a problem since GHDL only supports 1fs unless using mcode backend:
        https://ghdl.github.io/ghdl/using/InvokingGHDL.html#cmdoption-ghdl-time-resolution
        And even if it's not the default, it only supports full units (ps, ns, ... and not 10ns or 100ps).
        """
        return "{:d} {}".format(self.value, self.scale[cocotb.utils._get_simulator_precision()])


    def __add__(self, other) -> 'Time':
        return Time(self.value + other.value, 'step')

    def __sub__(self, other) -> 'Time':
        return Time(self.value - other.value, 'step')

    def __eq__(self, other) -> bool:
        return self.value == other.value
