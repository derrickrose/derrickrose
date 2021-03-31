#!/usr/bin/python3
# -*-coding:utf-8 -*
""" method split """
string = """je suis une chaine de caracteres"""
tab = string.split(" ")

""" join avec espace """
string1 = " ".join(tab)
print(tab)
print(string1)


""" redifinition de la methode print """
def printf(*liste,delimiteur=" ",fin= "\n"):
    var = ""
    for elmt in liste:
        var += delimiteur + str(elmt)
    var += fin
    var = var.strip()
    print(var)


""" definition de methode main """

if __name__ == '__main__':
    printf(1,1,2)
   
    """ on peut aussi passer une liste comme parametres de fonction voyez la diff"""
    string = """je suis une chaine de caracteres"""
    tab = string.split(" ")
    print(string)
    print(tab)
    print(*tab)

    """ intervation directement dans la liste """
    """ filtrer dans une liste """
    tab = [1,2,3]
    tab = [nb*nb for nb in tab]

    """trier une liste """
    tab.sort(reverse=True)
    print(tab)

    """ filter une liste """
    tab = [nb for nb in tab if nb%2 == 0]
    print(tab)
    
    """trier une liste de tuple"""
    table = []
    table.append(('a',1))
    table.append(('e',5))
    table.append(('b',2))
    table.append(('d',4))
    table.append(('c',3))
    table.sort(reverse=False)
    print(table)
    table = [(entier,char) for (char,entier) in table]
    table.sort(reverse=True)
    print(table)
    
    
