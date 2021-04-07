#!/usr/bin/python3
# -*- coding: utf-8 -*-

# chaine de caractere sous forme de commentaire multiligne
""" je suis
une chaine de caractere """
chaine_de_caractere = """ je suis une chaine de caractere multiligne """
print(chaine_de_caractere)

# couper et parcourir une chaine de caractere
chaine_de_caractere = chaine_de_caractere[0:5]
for char in chaine_de_caractere:
    print("charactere ", char)

# mettre en majuscule
chaine_de_caractere = chaine_de_caractere.upper()
print(chaine_de_caractere)

# formatter une chaine
un = 1
deux = 2
formatted = " je suis une chaine de caractere formatté avec {} et {} ".format(1, 2)
print(formatted)
formatted = " encore de la formattage {1} {0} ".format(2, 3)
print(formatted)
