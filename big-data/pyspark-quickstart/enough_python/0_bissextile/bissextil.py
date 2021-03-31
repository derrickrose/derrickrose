import os

annee = 0


while annee==0:
    annee = input("entrez une annee ")
    try:
        annee = int(annee)
    except:
        print("la valeur donnee de anee est invalide")

if annee%4==0:
    print("annee bissextile",annee)
else:
    print("annee non bissextile",annee) 


os.system("pause")
