#!/usr/bin/python3
# -*- coding: utf-8 -*-


def decomposer(nombre, dividande):
    """ methode qui retourne un tuple composer de la valeur entiere
    et du reste de la division
    """
    return int(nombre / dividande), nombre % dividande


if __name__ == "__main__":
    """ definition de la methode main """

    """ definition dun tuple """
    my_tuple = decomposer(10, 3)
    print(my_tuple)

    """ interchanger un tuple """
    a, b = 22, 5
    print("before interchange", a)
    a, b = b, a
    print("after interchange", a)
    a, b = 10, 10
    print("after change value", a)
    my_tuple = (a, b)
    print(my_tuple)
