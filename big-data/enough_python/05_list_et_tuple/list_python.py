#!/usr/bin/python3
# -*- coding: utf-8 -*-
""" declaration de liste"""
ma_liste = list()

""" ajout elmn liste """
ma_liste.append(2)
print(ma_liste)

""" declaration et initialisation liste """
second_list = [1, 2, 3]
second_list.append(4)
print(second_list)

"""acceder a un element de liste """
print(second_list[0])

""" inserer une valeur a une liste """
second_list.insert(0, 2)
print(second_list)

""" parcourir une liste """
for int in second_list:
    print(int)

""" parcourir une liste avec enumerate """
for elm in enumerate(second_list):
    print(elm)
for index, value in enumerate(second_list):
    print("valeur a la position {} est {} ".format(index, value))

""" supprimer un element de la liste """
print("avant suppression ==> {} ", second_list)
del second_list[0]
print("apres suppression ==> {} ", second_list)
print(second_list)

""" enlever une valeur das une liste (il enleve le premier match) """
second_list.append(2)
print("avant enlevement ==> {} ", second_list)
second_list.remove(2)
print("apres enlevement ==> {} ", second_list)
print(second_list)
