def decorateur_avec_param(fonction):
    def bonjour(nom):
        print(f"bonjour {nom}")

    return bonjour


@decorateur_avec_param
def salut(nom):
    print(f"salut {nom}")


if __name__ == "__main__":
    salut("frelin")
