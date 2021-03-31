#!/usr/bin/python3
# -*-coding:utf-8 -*
""" methode qui retourne un tuple composer de la valeur entiere
et du reste de la division 
"""
def decomposer(nombre,dividande):
    entier = nombre // dividande
    reste = nombre % dividande 
    return entier,reste

""" definition dun tuple """
mon_tuple = (1,2)
print(mon_tuple)
tuplee = 1,
print(type(tuplee))




""" definition de la methode main """
if __name__ == "__main__":
    value = decomposer(5,2)
    print(value[1])
    print(value[0])
    a,b = 1,2
    print(a)

    """ interchanger un tuple """
    a,b = b,a
    e = (a,b)
    print(e)
    e = (b,a)
    print(e)
    print(a)
    c = 1
    print("la valeur recente de c es {}".format(c))
    d = 2
    c,d=d,c
    print("la valeur recente de c es {}".format(c))
