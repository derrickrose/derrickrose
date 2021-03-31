#!/usr/bin/python3
# -*-coding:utf-8 -*

""" declaration de liste"""
liste = list()
print(liste)


""" ajout elmn liste """
liste.append(2)
print(liste)

""" declaration et initialisation liste """
ma_liste = [1,2]
print(ma_liste)

"""acceder a un element de liste """
print(ma_liste[1])

""" inserer une valeur a une liste """
ma_liste.insert(0,0)
print(ma_liste)

""" parcourir une liste """
for elmt in ma_liste:
    print(elmt)

""" parcourir une liste avec un enumartate """
for elm in enumerate(ma_liste):
    print(elm)

for i,el in enumerate(ma_liste):
    print("la valeur a la position {} est {}".format(i,el))

""" supprimer un element de la liste """
del ma_liste[0]
print(ma_liste)

""" enlever une valeur das une liste """
ma_liste.remove(2)
print(ma_liste)

