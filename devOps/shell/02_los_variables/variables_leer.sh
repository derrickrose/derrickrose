#!/bin/bash

#leer un variable desde el teclado

echo entrar el contenido de la variable valor en el teclado
read valor
echo "el valor es : $valor"
echo 'entrar los valores separado por espacio'
read valor valor2
echo "los valores son : $valor $valor2"
read -p 'entrar su nombre : ' nom
echo "Bonjour $nom !"
read -p 'Entrez votre login (5 caractères max) : ' -n 5 nom
echo "Bonjour $nom !"


