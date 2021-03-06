#!/bin/bash

read -p 'Entrez un répertoire : ' repertoire

if [ -d $repertoire ]
then
        echo "Bien, vous avez compris ce que j'ai dit !"
else
        echo "Vous n'avez rien compris..."
fi