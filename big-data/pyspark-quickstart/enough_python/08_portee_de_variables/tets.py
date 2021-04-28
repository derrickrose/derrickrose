#!/usr/bin/python3
# -*- coding: utf-8 -*-

a = 10
b = [1, 2]


def changer_valeur_de_a():
    a = 11
    print("valeur de a inside func", a)


def ajouter_valeur_sur_b():
    b.append(11)
    print("valeur de b inside func", b)


# passage par reference
c = b  # ici si on modifie l'un l'autre va aussi etre changée

# copie ou clone
d = list(c)  # par contre ici d possede une reference a elle seule
print("comparaison de reference", d is c)  # false car reference different
print("comparaison de rerence ", c is b)  # true


def modification_variable_globale():
    """ceci va modifier la valeur de la variabl a"""
    global a
    a = 122


if __name__ == '__main__':
    print(a)
    changer_valeur_de_a()
    print(a)
    print(b)
    ajouter_valeur_sur_b()
    print(b)
    print("valeur de a avant modif", a)
    modification_variable_globale()
    print("valeur de a apres modif global", a)
