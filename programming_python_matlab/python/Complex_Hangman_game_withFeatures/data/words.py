# file = open("countries-and-capitals.txt")
# print(file.read())
# file.close()

#contol+ü

import random


with open("countries-and-capitals.txt") as file:
    word_list = []
    for line in file:
        word_list.append(line.rstrip().split(" | "))
    # print(word_list)


def pick_word() -> list:
    return random.choice(word_list)

