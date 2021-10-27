def transform(c):
    print("here inside transform")
    return c


def inverse(c):
    print("here inside inverse")
    return c


def trace(a, b):
    print(a)
    print(b(True))


def jiji(ba, t):
    return 10 + ba + t


if __name__ == "__main__":
    """on peut envoyer une fonction comme parametre d'une autre fonction"""
    trace(10, transform)
    trace(10, inverse)
    lists = [1, 2, 3, 4]
    """utilisation de map pour transformer des valeurs"""
    lists = list(map(lambda x: jiji(x, 10), lists))
    print(lists)
