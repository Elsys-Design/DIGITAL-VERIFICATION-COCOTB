from framework import Time


def _test(d, string):
    assert str(d) == string, str(d) + "!=" + string


def test_main():
    print("Time tests started")
    _test(Time(10, "ns"), "0.010 us")
    _test(Time(10.123, "ns"), "10.123 ns")
    _test(Time(10.1234, "ns"), "10123.400 ps")
    _test(Time(12.987654, "ms"), "12987.654 us")
    _test(Time(12.9876543, "sec"), "12987654.300 us")
    _test(Time(123456, "ms"), "123.456 sec")
    _test(Time(1, "fs"), "0.001 ps")
    _test(Time(100000, "fs"), "0.100 ns")
    _test(Time(2101.2, "ns"), "2101.200 ns")
    _test(Time(1, "fs"), "0.001 ps")
    _test(Time(84, "step"), "0.084 ps")
    _test(Time(1530, "step"), "1.530 ps")
    print("Time tests passed")


if __name__ == "__main__":
    test_main()
