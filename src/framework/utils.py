def int_to_hex_string(word, word_size):
    return "0x{word:0{word_size}X}".format(word=word, word_size=word_size * 2)
