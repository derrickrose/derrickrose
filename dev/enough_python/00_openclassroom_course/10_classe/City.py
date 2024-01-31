class City:
    """A class to represent a city"""

    cities_count = 0

    @staticmethod
    def calculate_tax():
        return 20

    def afficher(self):
        return 0

    def set_name(self, name):
        self.name = name

    def get_name(self):
        return self.name

    def __init__(self, name, habitant):
        self.name = name
        self.habitant = habitant
        City.cities_count += 1

    def get_habitant(self):
        return self.habitant

    def get_name(self):
        return self.name

    # methode de classe
    def get_cities_count(cls):
        return cls.cities_count

    printt = staticmethod(afficher())
    print("aaa", printt)


if __name__ == "__main__":
    city = City("Tana", 10_000_000)
    ambanja = City("Ambanja", 100_000)
    print(city.name)
    print(city.habitant)
    print(City.cities_count)
    print(city.get_cities_count())
    print(City.get_cities_count(City))
    print("afficher ", City.afficher())  # en erreur si on utiliste une instance car une classe est generalement
    city.set_name("Ambilobe")
    print(city.name)
    print(city.get_name())
    print("call static method ", City.calculate_tax())
    print(dir(city))  # retrospection pour voir tous les attributs et methodes
    # d'ailleurs pr python tout es objet que ce soit attribut ou methode, la seule difference est que les methodes sont callables
