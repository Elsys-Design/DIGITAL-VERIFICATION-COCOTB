
def int_list_to_bytearray(data, is_big_endian, word_size=1, last_word_size=None):
    if last_word_size == None:
        last_word_size = word_size

    hex_data = bytearray()
    for d in data[:-1]:
        hex_data += d.to_bytes(word_size, 'big' if is_big_endian else 'little')
    hex_data += data[-1].to_bytes(last_word_size, 'big' if is_big_endian else 'little')
    return hex_data


def bytes_to_word_list(data, word_size=4, is_big_endian = True):
    hex_data = []
    for x in range(0, len(data), word_size):
        tot = 0
        end_y = min(word_size, len(data)-x)
        for y in range(end_y):
            tot = (tot << 8) + data[x+y]
        hex_data.append(tot.to_bytes(end_y, 'big' if is_big_endian else 'little'))
    return hex_data

