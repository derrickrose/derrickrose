#!/bin/bash

# hello world
echo "Hello World"
printf "%s\n" "hello world !"

# variable explicit and from read user input
VAR="2"
COMMAND=`whoami` #space is not allowed
printf "%s" "Enter your text! "
#read TAR #assign a value from user in put to TAR
echo ${VAR}
echo $COMMAND
TAR=$(pwd)
echo $TAR

#assign a variable from a file
read HOSTNAME < /etc/hostname
echo $HOSTNAME

#advanced method to read user input chapter24
