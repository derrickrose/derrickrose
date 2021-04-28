#!/usr/bin/python3
# -*- coding: utf-8 -*-


""" trier par valeur """


# inverser le tuple
def trier(liste: list):
    liste = [(a, b) for (b, a) in liste]
    liste.sort()
    return liste


if __name__ == "__main__":
    liste = [("fraise", 5), ("baba", 6), ("naranja", 8), ("toronca", 7), ("chips", 1), ("mimi", 2), ("bloos", 0)]
    liste = trier(liste)
    for elm in liste:
        print(elm)
        print(elm[0])


