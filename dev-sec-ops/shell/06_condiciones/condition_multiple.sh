#!/bin/bash

read -p "entrez votre age " age
read -p "etes vous celibataire y or n " statut

if [ $age -ge 18 ] && [ $statut = "y" ] || [ $statut = "n" ]; then
	echo "vous etes authorized to enter"
else
	echo "vous etes pas authorized to enter"
fi

