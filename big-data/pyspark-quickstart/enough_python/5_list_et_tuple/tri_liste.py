#!/usr/bin/python3
# -*-coding:utf-8 -*


def trier(liste:list):
    liste = [(b,a) for (a,b) in liste]
    liste.sort(reverse=False)
    return liste

if __name__ == '__main__':
    liste = [
    ("fraises", 18),
    ("prunes", 51),
    ("pommes", 4),
    ("poires", 76),
    ("melons", 22), ]
    
    print(liste)
    liste = trier(liste)
    print(liste)
    tuples = liste[0]
    print(tuples)
    """ parcours de tuple """
    for el in tuples:
        print(el)






