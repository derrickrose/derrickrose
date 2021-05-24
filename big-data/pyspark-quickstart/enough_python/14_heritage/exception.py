class EmptyException(Exception):
    def __init__(self, message):
        Exception.__init__(self, message)


def validate(label, value: str):
    if value == "":
        raise EmptyException("{} is empty".format(label))
    return value


if __name__ == '__main__':
    print(validate("nom", "bala"))
    print(validate("prenom", ""))
