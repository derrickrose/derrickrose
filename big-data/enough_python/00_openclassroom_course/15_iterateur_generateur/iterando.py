class RevStr(str):
    """ Reverser iteration """

    def __iter__(self):
        return ItRevStr(self)


class ItRevStr:
    def __init__(self, chaine_a_parcourir):
        self.chaine_a_parcourir = chaine_a_parcourir
        self.position = len(chaine_a_parcourir)

    def __next__(self):
        if self.position == 0:
            raise StopIteration
        self.position -= 1
        return self.chaine_a_parcourir[self.position]


text = "je suis a la plage"
iter_naka = iter(text)
print(next(iter_naka))

list_naka = [1, 2]
list_naka_iter = iter(list_naka)
print(" ahaha {}".format(next(list_naka_iter)))
print(" ahaha {}".format(next(list_naka_iter)))
try:
    print(" ahaha {}".format(next(list_naka_iter)))
except StopIteration as e:
    print("exception {}".format(e.__context__))
    print("inside excpeption")

a = RevStr("Bonjour les amis!!!")
for i in a:
    print(i)
print("----------------------------------------------")
a = iter(a)
print(next(a))
