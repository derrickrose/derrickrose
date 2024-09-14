#!/bin/bash

IFS=","
#arguments
#to run this should run with some value after the script <=> ./arguments hello world
echo $1 $2 #arguments start from 1 since zero is the running script actually
echo $0


# more on arguments
echo $# number of arguments
echo "$*" all positional parameters as a single world
echo $@ print all positional parameters as separate string
echo ${@:1:1} print one positional parameter since start from one and print only one

#special parameter
echo ----------------------
echo $? #exit status of last command
echo $! #PID of last background task
echo $$ #PID of shell
echo $_ #last argument of the previous command
echo $- #current set of options on your current shell