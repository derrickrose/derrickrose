class Person:
    """A class to represent a person"""

    def __init__(self):
        self.name = "Unknown"
        self.age = 0
        self.city = "Unknown"


if __name__ == "__main__":
    jean = Person()
    print(jean.name)
    jean.name = "Jean"
    print(jean.name)
