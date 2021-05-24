class Vehicule:

    def __init__(self, nombre_roues, type):
        self.nombre_roues = nombre_roues
        self.type = type

    def __repr__(self):
        return "nombre roues {} et type {}".format(self.nombre_roues, self.type)
