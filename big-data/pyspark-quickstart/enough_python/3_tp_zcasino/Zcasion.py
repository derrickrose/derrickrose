#!/usr/bin/python3
# -*-coding:utf-8 -*


from os import system
from random import randrange
from math import ceil
	

def getNumero(label,minimum,maximum=-1):
    numero = -1
    while numero==-1 or numero <minimum or (maximum>-1 and numero > maximum):
        courant = input(label)
        try:
            courant = int(courant)
            numero = courant
        except:
            print("erreur lors de la convertion")           
    return numero


def getNumeroJoue():
    return getNumero("entrez le numero jouee ",0,49)


def getMise(argentTotal):
    mise = -1
    while mise == -1 or mise > argentTotal:
        mise = getNumero("entrez votre mise ",1,1000000)
    return mise


def getArgentInitial():
    return getNumero("entrez votre argent inital ",1,-1)
    

def getCouleur(mise):
    if mise%2 == 0:
        return "noir"
    return "rouge"


def getGagnant():
    return randrange(50)


def getArgentGagnee(numeroJoue,gagnant,mise):
    if numeroJoue == gagnant:
        print("tres bien, vous avez gagne")
        return mise*2
    elif getCouleur(numeroJoue) == getCouleur(gagnant):
        print("pas mal vous avez trouve la couleur gagnante")
        print("Numero gagnant",gagnant,"- votre choix",numeroJoue,"- couleur gagnant",getCouleur(gagnant),"- votre couleur",getCouleur(numeroJoue))
        return ceil(mise/2)
    else:
        print("Dommage, vouz avez perdu!!! ")
        print("Numero gagnant",gagnant,"- votre choix",numeroJoue,"- couleur gagnant",getCouleur(gagnant),"- votre couleur",getCouleur(numeroJoue))
        return -mise


def jouer():
    jouer=True
    argentTotal = getArgentInitial()
    while jouer==True:  
        mise = getMise(argentTotal)
        numeroJoue = getNumeroJoue()
        numeroGagnant = getGagnant()
        argentGagnee = getArgentGagnee(numeroJoue,numeroGagnant ,mise)
        argentTotal+=argentGagnee
        if argentTotal == 0:
            jouer = False 
        else:
            reponse = input("Voulez-vous continuer a jouer? o/n ")            
            if reponse == 'N' or reponse == 'n': 
                jouer = False
    print("Aurevoir et a bientot!!!")   


if __name__ == "__main__":
    jouer()







