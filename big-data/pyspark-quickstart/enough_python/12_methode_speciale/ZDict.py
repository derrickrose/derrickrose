class ZDict:
    """class conteneur"""

    def __init__(self):
        self._dictionnaire = {}

    def __getitem__(self, item):
        return self._dictionnaire[item]

    def __setitem__(self, key, value):
        self._dictionnaire[key] = value

    def __len__(self):
        return self._dictionnaire.__len__()

    def __contains__(self, item):
        return self._dictionnaire.__contains__(item)


if __name__ == '__main__':
    diction = ZDict()
    diction.__setitem__(1, "un")
    diction.__setitem__(2, "deux")
    print(diction.__getitem__(1))
    print(len(diction))
    print(diction.__str__())
    print(diction.__repr__())

    print(1 in diction)
