#!/usr/bin/python3
# -*-coding:utf-8 -*
"""module multipli contenant la fonction table"""
import os


def multiplier(nb,max=10):
    index = 1
    while index<=max:
        print(nb," * ", index," = ", nb*index)
        index+=1

if __name__ == "__main__":
    multiplier(2)
    os.system("pause")
