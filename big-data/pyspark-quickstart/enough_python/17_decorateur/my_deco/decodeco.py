def new_greetings(function):
    def greetings(name):
        print(f"Hello {name}!")

    return greetings


def greetings_with_param(weather):  # ici on defini le param a envoyé sur le decorateur
    def function_redefinition(function):  # la vrai fonction appelé et prend en param la fonction a modifier
        def greetings(name):  # name est param envoyé lors de l'appel de la fonction décorée
            print(f'Hello {name} the weather is {weather}')

        return greetings

    return function_redefinition
