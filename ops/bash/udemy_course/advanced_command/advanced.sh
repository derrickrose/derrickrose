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

# find to search file
touch baba.{txt,csv,pdf,xlsx} && ls
chmod 777 baba.txt
find . -name baba.pdf # the dot here is the starting point from where to search
find . -type f -name baba.txt # to search for file and d to search for directory
find . -type f -name "baba*" #file
find . -type d -name "baba*" #directory
find . -perm 777
find . ! -perm 777 # not 777 permission file
find . -user frils
find /tmp -name "." # search for directories with name containing dot

# use cases to delete empty files or directories
mkdir toto.adala.dir
find . -empty -type f | xargs rm #supprimer les fichiers vides
find . -empty -type d | xargs rmdir #supprimer les répertoires vides

# commande tr
echo "welcome to bash scripting" | tr [a-z] [A-Z] # uppercase
echo "welcome to paris" | tr " " "\n" # replace space with on line return
echo "{hello} world here [val]" | tr "{}" "[]"
echo "welcome to here" | tr -d "w"  #delete w
echo "welcome in 3 2 1 there" | tr -d [:digit:] # delete all digital characters
echo "welcome in 3 2 1 there" | tr -cd [:digit:] # delete all not digit characters

# grep
grep frils /etc/passwd # grep pattern file
grep "/bin/bash" /etc/passwd
grep -c "/bin/bash" /etc/passwd # -c option to count the matches
grep -m 1 "/bin/bash" /etc/passwd # limit the number of match
grep -n "/bin/bash" /etc/passwd # print also the line number of the matching line
grep -e "^frils" /etc/passwd # use regular expression to match caret symbol to fit the pattern from the begining of the text


# use case to match using pattern file
echo "[[:digit:]]" > pattern.txt
echo "this is a digit 30200 \n here 1200" >> text.txt && echo "bad boy" >> text.txt
echo "its a bag" >> text.txt
echo "his is begging" >> text.txt
grep -f pattern.txt text.txt
grep -o -f pattern.txt text.txt # print just the matching values
grep -w "this" text.txt # to match the word and nothing else
grep -B 2 "this" text.txt #print 2 lines before the match
grep -A 2 "this" text.txt #print 2 lines after the match
grep -C 2 "this" text.txt #print 2 lines before and after the match
grep -x "bad boy" text.txt #to match the line exactly as it
grep -n -E "b(a|e)"g text.txt
rm pattern.txt text.txt


