#!/bin/bash

# echo with brace expansion
echo {1..3}
echo {A..Z} {1..3}
echo {A..Z}{1..3}
echo {1..10..2} #odd number
echo {2..10..2} #even number

# xargs command to build and execute command from standard input
touch file-{1..10}.txt
# trying to delete all text files it won't work
ls *.txt | rm
# to fix we use xargs
ls *.txt | xargs rm

# list all users
cat /etc/passwd | cut -d: -f1
cut -d: -f1 < /etc/passwd #works only on files
cat /etc/passwd | cut -d: -f1 | xargs #to have them in one line

