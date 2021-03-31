class Personne: # definition de la classe personne
    """Classe definissant une personne caracterisee par:
    -son nom
    -son prenom
    -son age
    -son lieu de residence"""


    def __init__(self):
        """Pour l'instant nous allons definir qu'un seul attribut"""
        self.nom = "Dupont"

if __name__ == "__main__":
    personne = Personne()
    print(personne.nom)
