#!/bin/bash

# difference between regex and glob
# regex match text and glob match file
# example
# regex ==> ls | grep [0-9]file*.txt
# glob ==> ls [0-9]?file*.txt

# shell glob options
# nullglob #doesnt dislpay any kind of error on the current shell
mkdir test_null_glob
cd test_null_glob
touch {1..9}.txt
shopt -s nullglob
echo "here searching for file with extension jpg and nullglob set"
FOUND=0
for i in *.jpg
do
 echo "$i"
 FOUND=$((FOUND+1))
done
echo $FOUND

echo 5 seconds break
sleep 5
shopt -u nullglob
echo "here searching for file with extension jpg and nullglob set there should print a error"
FOUND=0
for i in *.jpg
do
 echo "$i"
 FOUND=$((FOUND+1))
done
echo $FOUND
cd ..
rm -rf test_null_glob

# failglob  #will display fail opposite of nullglob
# dotglob # if active will match hidden file
touch .hidden
shopt -u dotglob
echo search for all files with hidden unactive
echo * #not showing hidden
echo pause 5 seconds
sleep 5

echo searching for all files with dotglob active
shopt -s dotglob
echo *

#recursively search for all possible paths
echo ** > reverse.txt
cat reverse.txt

# nocaseglob #not case sensitive
# globstar
# extglob

# how to use it
# shopt -s globname --> set it
# shopt -u globname --> unset it
# shopt -p --> print out the current values set
rm -rf .hidden
rm -rf reverse.txt

