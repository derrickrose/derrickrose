def fizz_buzz(valor):
    if valor % 3 == 0 and valor % 5 != 0:
        return "fizz"
    elif valor % 3 != 0 and valor % 5 == 0:
        return "buzz"
    elif valor % 3 == 0 and valor % 5 == 0:
        return "fizzbuzz"
    else:
        return str(valor)


def fizz_buzz_2(valor):
    valor_string = ""
    if valor % 3 == 0:
        valor_string += "fizz"
    if valor % 5 == 0:
        valor_string += "buzz"
    if valor % 3 != 0 and valor % 5 != 0:
        valor_string += str(valor)
    return valor_string


def fizz_buzz_3(valor):
    fizz = not valor % 5
    buzz = not valor % 3
    if fizz and buzz:
        return "fizzbuzz"
    if fizz:
        return "fizz"
    if buzz:
        return "buzz"
    else:
        return str(valor)


if __name__ == '__main__':
    print(fizz_buzz(2))
    print(fizz_buzz(45))
    print(fizz_buzz(9))
    print(fizz_buzz(25))

    print(fizz_buzz_2(2))
    print(fizz_buzz_2(45))
    print(fizz_buzz_2(9))
    print(fizz_buzz_2(25))

    print(fizz_buzz_3(2))
    print(fizz_buzz_3(45))
    print(fizz_buzz_3(9))
    print(fizz_buzz_3(25))
