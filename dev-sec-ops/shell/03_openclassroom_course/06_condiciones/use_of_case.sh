#!/bin/bash
read -p "entrez votre nom :" name
case $name in
	"bruno")
		echo "bonjour bruno" ;;
	"frelin")
		echo "bonjour frelin" ;;
	*)
		echo "bonjour nouveau venu"
esac
