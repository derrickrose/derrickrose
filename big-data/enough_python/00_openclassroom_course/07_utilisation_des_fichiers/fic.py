#!/usr/bin/python3
# -*- coding: utf-8 -*-
import os

if __name__ == '__main__':
    print("this is a test ")
    print(os.getcwd())
    # os.chdir("D:")
    # print(os.getcwd())
    file = open("files/file.txt", 'r')
    content = file.read()
    print(content)
    file.close()
    print("--------------best practice using with ")
    import pickle

    with open("files/file.txt", "r") as my_file:
        file_content = my_file.read()
        print(content)
    print("--------------best practice using with and pickle")
    with open("files/copied.txt", "wb") as fic:
        mon_pickler = pickle.Pickler(fic)
        mon_pickler.dump(file_content)
    with open("files/copied.txt", "rb") as copied:
        pickler_content = pickle.Unpickler(copied).load()
        print("pickler content ", pickler_content)
