#!/usr/bin/python3
# -*- coding: utf-8 -*-
class Personne:  # definition de la classe personne
    """Classe definissant une personne caracterisee par:
    -son nom
    -son prenom
    -son age
    -son lieu de residence"""

    def __init__(self):
        """Pour l'instant nous allons definir qu'un seul attribut"""
        self.nom = "Dupont"

    def __init__(self, name):
        """Pour l'instant nous allons definir qu'un seul attribut"""
        self.nom = name

    def get_nom(self):
        return self.nom


if __name__ == "__main__":
    mama = Personne("mama")
    print(mama.get_nom())
