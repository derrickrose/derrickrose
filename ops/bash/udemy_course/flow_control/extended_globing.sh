#!/bin/bash


# @(PATTERN) matches only one occurrence
# ?(PATTERN) matches 0 ore one
# +(PATTERN) more than one
# *(PATTERN) zero or more
# !(PATTERN) matches no occurrences
# !(?(PATTERN)) negation of PATTERN support nested too



# extended globing
shopt -s extglob
touch ab.txt
touch ba.txt
touch a.md
touch a.sh
# goal to remove all files starting by a but not md
sleep 10
rm @(a|b*)!(.md) # will delete all file starting with a or b but not ending with md
rm a.md

touch {a..z}.sh
rm {a..z}.sh




#