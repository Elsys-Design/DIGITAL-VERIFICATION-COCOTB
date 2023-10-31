from framework.time import Time



def test(d, string):
    assert str(d) == string, str(d) + "!=" + string


test(Time(10, "ns"), "0.010 us")
test(Time(10.123, "ns"), "10.123 ns")
test(Time(10.1234, "ns"), "10123.400 ps")
test(Time(12.987654, "ms"), "12987.654 us")
test(Time(12.9876543, "sec"), "12987654.300 us")
