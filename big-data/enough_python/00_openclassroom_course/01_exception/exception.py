#!/usr/bin/python3
# -*- coding: utf-8 -*-


diviseur = input("entrez un numero ")

try:
    1 / diviseur
except ZeroDivisionError as error:
    print("error ", error)
except TypeError as error:
    print("error type ", error)
