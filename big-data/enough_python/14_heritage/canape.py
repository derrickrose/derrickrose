class ObjetPourAssoir:
    def __init__(self, action):
        self.action = action

    def __repr__(self):
        return "on est ici pour assoir"


class ObjetPourDormir:
    def __init__(self, action):
        self.action = action

    def __repr__(self):
        return "on est ici pour dormir"


class Canape(ObjetPourDormir, ObjetPourAssoir):  # ici __repr__ prend la definition de la super classe en premier param
    def __init__(self, nom):
        self.nom = nom
        ObjetPourAssoir.__init__(self, "assoir")
        ObjetPourDormir.__init__(self, "dormir")  # ici action prend la valeur redefinit en dernier


if __name__ == '__main__':
    canape = Canape("canape-lit")
    print("nom", canape.nom)
    print("action", canape.action)
    print(canape)
