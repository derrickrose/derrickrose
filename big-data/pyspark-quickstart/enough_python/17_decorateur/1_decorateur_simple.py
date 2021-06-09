def salut():
    print("hello world")


def mon_decorateur(fonction):
    print("la fonction mon_decorateur a ete appele par la fonction", fonction)
    return fonction


@mon_decorateur  # ici mon_decorateur va etre appelée une seule fois avant la definition de la fonction salut_decore
def salut_decore():
    print("salut")


if __name__ == "__main__":
    print("inside main")
    mon_decorateur(salut)  # c'est la meme chose que definit avec annotation @mon_decorateur
