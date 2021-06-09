import datetime
from os import system


def get_duration(function):
    start = datetime.datetime.now()
    system("pause")

    def hello():
        return function()

    print("duration", datetime.datetime.now() - start)
    return hello


@get_duration
def greetings():
    print("hello")


if __name__ == "__main__":
    greetings()
