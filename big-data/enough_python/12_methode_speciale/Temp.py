class Temp:

    def __init__(self):
        self.first = "0"
        self.second = "10"
        self.temp = "4"

    # """
    def __getstate__(self):  # this method is called when saving object in this case we can prove it
        dic = dict(self.__dict__)
        dic["temp"] = 0
        return dic
    # """


if __name__ == '__main__':
    print("a")
    temp = Temp()
    import pickle

    with open("files/temp.txt", "wb") as fic:
        pickle.dump(temp, fic)

    print("is fic closed", fic.closed)

    with open("files/temp.txt", "rb") as fic:
        loaded: Temp = pickle.load(fic)
        print(loaded.__dict__)
        fic.close()
