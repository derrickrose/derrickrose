class Duration:

    def __init__(self, min, sec):
        self.min = min
        self.sec = sec

    def __repr__(self):
        return "{}:{}".format(self.min, self.sec)

    def __add__(self, other):
        new_duration = Duration(0, 0)
        new_duration.sec = self.sec + other
        new_duration.min = self.min
        if new_duration.sec >= 60:
            new_duration.min += new_duration.sec // 60
            new_duration.sec = new_duration.sec % 60
        return new_duration

    def __radd__(self, other):  # redirection vers methode add lors d'un entier placé avant l'objet
        return self.__add__(other)

    def __iadd__(self, other):
        self.sec += other
        if self.sec >= 60:
            self.min += self.sec // 60
            self.sec += self.sec % 60
        return self

    def __eq__(self, other):
        return self.min == other.min and self.sec == other.sec

    def __lt__(self, other):
        return self.min + (self.sec * 60) < other.min + (other.sec * 60)


if __name__ == "__main__":
    duree = Duration(5, 10)
    print(duree)
    duree = duree.__add__(55)
    print(duree)
    new = duree + 55  # va executer la methode duree.__add__()
    print(new)
    # definir avant la methode __radd__
    # new = 55 + duree  #en erreur car 55 ne sait pas par que faire, pour ce faire, il faut ajouter la methode __radd__
    b = 33 + new
    print("b ", b)
    b += 33
    print("b ", b)
    print("equality", b == new)
    print("less than", b < new)
    print("great than", b > new)
