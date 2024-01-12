def int_to_hex_string(word, word_size):
    return "0x{word:0{word_size}X}".format(word=word, word_size=word_size * 2)

def get_full_bus_name(bus):
    name = bus._entity.name
    if bus._name is not None:
        name += "." + bus._name
    return name
