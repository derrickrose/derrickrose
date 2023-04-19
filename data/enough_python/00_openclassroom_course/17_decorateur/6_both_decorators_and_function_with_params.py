from my_deco.decodeco import *


# on importe une fonction depuis une classe

@new_greetings
def hello(name):
    print(f"Bonjour {name}")


@greetings_with_param("rainy")
def hello_with_decorator_with_param(name):
    print(f"Bonjour {name}")


if __name__ == "__main__":
    hello("Frelin")
    hello_with_decorator_with_param("Frelin")
