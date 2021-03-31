#!/usr/bin/python3
# -*-coding:utf-8 -*

""" dictionnaire """
dic = dict()
print(dic)
dic['a']='A'
dic['b']='B'
print(dic)

""" autre moyen de definir un dictionnaire """
dic = {}
dic['c']='C'
dic['d']='D'
print(dic)

""" considerons un echiquier """
""" http://www.echecspourtous.com/?page_id=168 """
dic = {'d':1,'e':2}
print(dic)

""" pour supprimer un element dun dictionnaire """
del dic['d']
print(dic)

""" le parcours simple d'un dictionnaire """          
for key in dic:
    print("la valeur de la clee {} est {}".format(key,dic[key]))


""" on se sert parfois des dictionnaires pour stocker des fonctions """
functions = {}
print_2 = print
def saluer():
    print("salut le monde")
functions['print'] = print_2
functions['saluer'] = saluer
functions['saluer']()
functions["print"](type(functions))


""" parcours des dictionnaires aveec .keys() .values() .items() """
for key in dic.keys():
    print(key)

for value in dic.values():
    print(value)

for key,value in dic.items():
    print("la valeur de la clee {} est {}".format(key,value))

""" les dictionnaires peuvent récupérer les paramètres nommés dune fonction """
def print_(*param,**param_nomme):
    delimiteur = param_nomme['delimiteur']
    fin = param_nomme['fin']
    var = "" 
    for elm in param:
        var += delimiteur + elm
    var += fin
    var = var.strip()
    print(var)


if __name__ == "__main__":
    liste = ['a','b']
    dicto = {'delimiteur':' ','fin':'\n'}
    print_(*liste,**dicto)



