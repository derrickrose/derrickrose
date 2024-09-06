#!/bin/bash


START=$(date +%s)
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
TAR=$(pwd) # only for commands
echo $TAR

#assign a variable from a file
read HOSTNAME < /etc/hostname #will read just the first name
echo $HOSTNAME

#environment variable
env
echo $BASH_VERSION
echo $BASHOPTS # bash options
echo $CDPATH #may n t be present according to the OS
echo $PYTHONPATH
echo $COLUMNS #number of character column can be displayed on the screen
echo $DIRSTACK
echo $HISTFILE
echo $PATH
echo $SECONDS # in second shell has been running
sleep 2
END=`date +%s` # same as inside $()


#calculation numeric
TIME_TAKEN=$((END-START))
echo time taken $TIME_TAKEN

