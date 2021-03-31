import os
"""pour calculer une annee bissextile"""

annee = 0
while annee==0:
    annee=input("entrez une annee ")
    try:  # On essaye de convertir l'annee en entier
        annee = int(annee)
    except:
        annee=0
        print("Erreur lors de la conversion de lannee.")

if annee%400==0 or (annee%4==0 and annee%100!=0):
    print("annee bissextile",annee)
else:
    print("non bissextile",annee)
    
os.system("pause")
