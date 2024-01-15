def int_to_hex_string(word, word_size):
    return "0x{word:0{word_size}X}".format(word=word, word_size=word_size * 2)


def get_full_bus_name(bus):
    name = bus._entity._name

    # adding bus name
    if bus._name is not None:
        name += "." + bus._name

    # removing top name
    # this actually handles many different cases:
    # - if the bus has no name and is at the top, do nothing
    # - if the bus has no name and isn't at the top, keep only device name
    # - if the bus has a name and is at the top, keep only bus name
    # - if the bus has a name and isn't at the top, keep only path.busname
    #       with path not containing the top name
    pos = name.find(".")
    if pos != -1:
        name = name[pos + 1 :]

    return name
