from vehicule import Vehicule


class Moto(Vehicule):

    def __init__(self, nom):
        Vehicule.__init__(self, 2, "moto")
        self.nom = nom

    """ #si on ne redefinit pas __repr__ elle applee celle de la classe mere
    def __repr__(self):
        return "nom {} nombre roues {} et type {}".format(self.nom, self.nombre_roues, self.type)
    #"""


if __name__ == '__main__':
    moto = Moto("Honda XR")
    print("nombre de roues", moto.nombre_roues)
    print("type", moto.type)
    print("nom", moto.nom)
    print(isinstance(moto, Moto))
    print(issubclass(Vehicule, Moto))
    print(isinstance(moto, Vehicule))
    vehicule = Vehicule(4, "voiture")
    print(isinstance(vehicule, Moto))
    print(moto.__str__())
