#!/usr/bin/python3
# -*- coding: utf-8 -*-

def multiplier(valeur, max=10):
    for index in range(1, max + 1):
        print("{0} * {1} = {2}".format(valeur, index, valeur * index))
        ++index


if __name__ == '__main__':
    multiplier(2)
