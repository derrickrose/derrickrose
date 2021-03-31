#!/usr/bin/python3
# -*- coding: utf-8 -*-

from random import randrange
from math import ceil


def recuperer_numero_gagnant():
    return randrange(1, 100, 1)


def recuperer_couleur_par_numero(numero):
    if numero % 2 == 0:
        return "noir"
    else:
        return "rouge"


def recuperer_valeurs_gagnant():
    numero = recuperer_numero_gagnant()
    return {
        "numero": numero,
        "couleur": recuperer_couleur_par_numero(numero)
    }


def calculer_gain(mise, choix, valeurs_gagnant):
    print("Numero gagnant {0} avec la couleur {1}".format(valeurs_gagnant["numero"], valeurs_gagnant["couleur"]))
    couleur = recuperer_couleur_par_numero(choix)
    print("Votre choix {0} votre couleur dans ce cas {1}".format(choix, couleur))
    if choix == valeurs_gagnant["numero"]:
        print("Felicitation, vous avez doublé votre mise!!!")
        return mise
    elif couleur == valeurs_gagnant["couleur"]:
        print("Felicitation, on vous rembourse la moitié de votre mise!!!")
        return -ceil(mise / 2)
    else:
        print("Mince alors, vous avez perdu votre mise!!!")
        return -mise


def recuperer_valeur(definition):
    valeur = 0
    while valeur == 0:
        try:
            valeur = int(input(definition))
        except TypeError as err:
            print(err)
        except ValueError as err:
            print(err)
    return valeur


def vouloir_joueur():
    vouloir_jouer = None
    while vouloir_jouer is None:
        vouloir_jouer = input("Voulez-vous jouer ? o/n ")
        if vouloir_jouer in ['o', 'O', 'N', 'n']:
            return vouloir_jouer in ['o', 'O']
        else:
            print("La valeur entrée est pas bonne!!")
            vouloir_jouer = None


def placer_une_mise(argent):
    mise = -1
    if argent == 0:
        return mise
    while mise == -1:
        mise = recuperer_valeur("Placez votre mise ")
        if mise > argent:
            print("Votre mise {0} ne doit pas dépasser votre argent {1}".format(mise, argent))
            mise = -1
    return mise


if __name__ == '__main__':
    argent = recuperer_valeur("Votre argent de depart ")
    play = True
    while play == True:
        print("---- votre argent est {0} ----".format(argent))
        mise = placer_une_mise(argent)
        choix = recuperer_valeur("Jouez votre numero ")
        gain = calculer_gain(mise, choix, recuperer_valeurs_gagnant())
        argent = argent + gain
        if argent == 0:
            print("Vous avez gaspiller tout votre argent, au-revoir!")
            play = False
        else:
            play = vouloir_joueur()
