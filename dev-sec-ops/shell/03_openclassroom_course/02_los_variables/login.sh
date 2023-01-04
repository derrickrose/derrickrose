#!/bin/bash

read -p "entrar su login (limite 10 caracteres) : " -n 10 login
read -p "entrar su contrasegna (limites 10 caracteres y no pasa de 60 secundos) : " -n 10 -t 60 -s pass
echo -e "\nsu login es $login y su contrasegna es $pass"

