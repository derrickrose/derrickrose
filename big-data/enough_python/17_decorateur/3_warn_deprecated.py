def warn_deprecated(fonction):
    def warn():
        raise Exception("this is a deprecated function use hello instead")
        return fonction()

    return warn


@warn_deprecated
def salut():
    print("salut")


def hello():
    print("hello")


if __name__ == '__main__':
    hello()
    salut()
