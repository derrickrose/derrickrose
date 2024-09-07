#!/bin/bash

# replacing WORLD by world
VAR="HELLOworld"
echo $VAR
echo ${VAR/world/WORLD} # replace the first occurence
echo $VAR | tr "world" "WORLD"
VAR1="hello world, this super crazy world, I live in this world"
echo ${VAR1//world/WORLD} #replace all occurence

# substring
echo ${VAR:0:5} # substring start from 0 and just take 5 characters from there
echo ${VAR::5} # same as 0 to 5
echo ${VAR:5} # substring and take from the 5th character
echo ${VAR:(-3):2} #whoud be rl printed since from the end it doesnt count from 0 but -1

#to upper case
echo ${VAR^^}

#to lower case
echo ${VAR,,}
echo ${VAR,} # lowercase just first letter
var="bonjour le jour"
echo ${var^} # uppercase just first letter

#substring removal
VAR="HELLOworld, a greeting for the world in which i live; this world is so damn crazy"
echo ${VAR#*world} # take of all on the left of the first matching word including the matching word
echo ${VAR##*world} # take of all on the left of the last matching word

#substring removal from the end (right)
echo ${VAR%world*} # take of all on the right of the first matching word including the matching word
echo ${VAR%%world*} # take of all on the right of the last matching word including the matching word

#string length
echo ${#VAR}

#concatenation
VAR2="hello "
VAR3="world!"
echo $VAR2$VAR3
