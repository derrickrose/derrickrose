class PersonalComputer:

    def __init__(self, brand, model):
        self.brand = brand
        self.model = model

    def __repr__(self):
        return """PersonalComputer : brand({}), model({})
        """.format(self.brand, self.model)

    def __getattr__(self, item):
        return "Il n'y a pas d'attribut {} dans cette classe".format(item)

    """
    def __setattr__(self, key, value):
        self.__class__.__setattr__(self, key, value)
        """  # cree une redondance cyclique


if __name__ == '__main__':
    lenovoP50 = PersonalComputer("Lenovo", "P50")
    print(lenovoP50.__repr__())
    lenovoP50.__setattr__('brand', "linivi")
    print(lenovoP50.__repr__())
    # bonus
    print(getattr(lenovoP50, 'brand'))
    print(getattr(lenovoP50, 'model'))
    print(hasattr(lenovoP50, 'model'))
    delattr(lenovoP50, 'model')
    print(hasattr(lenovoP50, 'model'))
    print(getattr(lenovoP50, 'model'))
    print(hasattr(lenovoP50, 'model'))
    print(lenovoP50.__repr__())  # remarque si l'attribut a été effacé le champ existe mais pas de valeur
    setattr(lenovoP50, 'model', 'P50')
    setattr(lenovoP50, 'pamako', 'pamako')
    print(lenovoP50.__repr__())
    print(hasattr(lenovoP50, 'pamako'))
    print(lenovoP50.__repr__())
