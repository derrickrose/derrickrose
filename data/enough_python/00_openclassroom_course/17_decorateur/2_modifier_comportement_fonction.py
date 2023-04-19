def new_decorator(function):
    def new_function():
        print("we are calling la fonction ", function)
        return function()  # quand on substitue la fonction, on est obligé de l'appeler la fonction ancienne

    return new_function


@new_decorator
def function():
    print("hello world")


if __name__ == "__main__":
    function()
    # decorator(function)
