#!/usr/bin/python3
# -*- coding: utf-8 -*-

""" definir un dictionnaire """
dict1 = dict()
dict1['test'] = 'test'
print(dict1)

""" autre moyen de definir un dictionnaire """
dict1 = {}
dict1['test1'] = 'test'
dict1['test1'] = 'test'
print(dict1)

""" considerons un echiquier """
""" http://www.echecspourtous.com/?page_id=168 """
dict1 = {
    "e": 1,
    "b": 0
}
print(dict1)

""" pour supprimer un element dun dictionnaire """
del dict1['e']
print(dict1)
""" le parcours simple d'un dictionnaire """
dict1['a'] = 2
dict1['c'] = 90
print(dict1)
for elm in dict1:
    print("{} ".format(elm))
""" on se sert parfois des dictionnaires pour stocker des fonctions """
printer = print
dict1['printer'] = printer
print(dict1)

""" parcours des dictionnaires aveec .keys() .values() .items() """
for key in dict1.keys():
    print("with .keys()  key {} {}".format(key, dict1[key]))

for key, value in dict1.items():
    print("with .items - {}{}".format(key, value))

for val in dict1.values():
    print("with values {}".format(val))

""" les dictionnaires peuvent récupérer les paramètres nommés dune fonction """


def printa(*param, **param_nomee):
    var = ""
    limit = param_nomee['limit']
    fin = param_nomee['fin']
    for element in param:
        var += limit + element
    var += fin
    print(var)


def print_(*param, **param_nomme):
    delimiteur = param_nomme['delimiteur']
    fin = param_nomme['fin']
    var = ""
    for elm in param:
        var += delimiteur + elm
    var += fin
    var = var.strip()
    print(var)


def te(a, *b, **c):
    print(a['ac'])
    print(b)
    print(c)


def konka(ka, kb, kc):
    print(ka)
    print(kb)
    print(kc)


if __name__ == "__main__":
    param = ["1", "2", "3", "4"]
    param_nomee = {'fin': '\n', 'limit': ' '}
    printa(*param, **param_nomee)
    liste = ['a', 'b']
    dicto = {'delimiteur': ' ', 'fin': '\n'}
    print_(*liste, **dicto)
    print("---------------")
    tata = {'ac': 'aa', 'bc': 'bb'}

    tutu = {**tata, 'cc': 'ee'}
    te(tutu)
    k = {'ka': 'a', 'kb': 'b', 'kc': 'c'}
    konka(**k)
