#!/bin/bash
read -p "entrez votre nom :" name
case $name in
	"bruno" | "baba")
		echo "bonjour bruno baba" ;;
	"frelin" | "andrianarisoa" | "harihaja")
		echo "bonjour frelin" ;;
	*)
		echo "bonjour nouveau venu"
esac
