#!/usr/bin/python3
# -*- coding: utf-8 -*-
""" method split """
ma_chaine = "je suis une chaine de caractere"
tab = ma_chaine.split(" ")
print(tab)

""" join avec espace """
chaine = " ".join(tab)
print(chaine)

""" redifinition de la methode print """


def printf(ma_liste, separateur=" ", fin="\n"):
    var = ""
    for el in ma_liste:
        var += str(el) + separateur
    var += fin
    print("===> ", var.strip())


def filtre_pair(liste):
    return [i for i in liste if i % 2 == 0]


def fun(*lis):
    """présence de étoile donc ici considéré comme liste de variable lis <=> [var1,var2]"""
    """sans étoile c'est considéré comme une seule variable"""
    for index, valor in enumerate(lis):
        for a, b in enumerate(valor):
            print("({},${}) => ${} ".format(index, a, b))


""" definition de methode main """
if __name__ == '__main__':
    """ on peut aussi passer une liste comme parametres de fonction voyez la diff"""
    fun([1, 2, 3, 4], [1, 2, 3])

    """ filtrer dans une liste """
    liste = filtre_pair([0, 2, 18, 2, 5, 6])
    printf(liste)

    """trier une liste """
    liste.sort()
    printf(liste)
