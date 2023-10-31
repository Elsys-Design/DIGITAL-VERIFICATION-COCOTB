from duration import Duration



def test(d, string):
    assert str(d) == string, str(d) + "!=" + string


test(Duration(10, "ns"), "0.010 us")
test(Duration(10.123, "ns"), "10.123 ns")
test(Duration(10.1234, "ns"), "10123.400 ps")
test(Duration(12.987654, "ms"), "12987.654 us")
test(Duration(12.9876543, "sec"), "12987654.300 us")
