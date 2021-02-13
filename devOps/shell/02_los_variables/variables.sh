#!/bin/bash

#script para mostrar un variable con shell

message='Bonjour tout le monde'
echo $message
echo "el contenido de la variable es : $message"

message=`pwd`
echo "estas en el directorio : $message"
