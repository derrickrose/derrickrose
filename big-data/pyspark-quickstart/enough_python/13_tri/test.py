class Etudian:

    def __init__(self, name, age, score):
        self.name = name
        self.age = age
        self.score = score

    def __repr__(self):
        return "(name{} age{} score{})".format(self.name, self.age, self.score)


if __name__ == '__main__':
    lista = [5, 2, 3, 8, 1, 5, 6]
    print(sorted(lista))  # return a new object, don't act on the source
    print(lista)
    lista.sort()  # change directly the object
    print(lista)
    # --------------------------------
    # nom, age, note
    todo = [('manuel', 10, 10), ('arbi', 12, 12), ('coca', 11, 15)]
    print(sorted(todo))
    # trie par note
    todo = [(b, a, c) for (a, b, c) in todo]
    todo.sort(reverse=True)
    todo = [(b, a, c) for (a, b, c) in todo]
    print(todo)
    # --------------------------------
    print('---------------------')
    # reduire la complexite
    # argument key des methodes de tri
    pa_hacer = [('manuel', 10, 10),
                ('arbi', 12, 0),
                ('coca', 11, 15)]

    print(pa_hacer)
    print(sorted(pa_hacer, key=lambda x: x[2]))
    # --------------------------------
    print("# --------------classe---avec sorted---------------")
    classe = [
        Etudian("jean", 12, 12),
        Etudian('arnaud', 11, 18),
        Etudian("patrick", 10, 11),
        Etudian("romeo", 12, 15)
    ]
    print(classe)
    print(sorted(classe, key=lambda x: x.name))

    print("# -------------encore plus rapide avec itemgetter et attrgetter---------------")
    from operator import attrgetter
    from operator import itemgetter

    print(sorted(classe, key=attrgetter("score")))
    print(sorted(pa_hacer, key=itemgetter(2)))
    classe.append(Etudian("arnaudd", 18, 10))
    classe.sort(key=attrgetter("score", "age"))
    print(classe)
