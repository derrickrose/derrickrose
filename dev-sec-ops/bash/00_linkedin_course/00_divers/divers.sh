#!/usr/bin/bash
#to check type of a linux command type [cmd]
#example : type bash --> will return bash is /usr/bin/bash

message="bonjour tout le monde"
# to uppercase with ^^
echo "${message^^}"
toto="${message^^}"

# to lowercase with ,,
echo "${toto,,}"

# to print the size with #
echo "${#toto}"

# to substring with :
# note to start with 0 then take four character from the position 4
echo "${toto:3:4}"

# escape built in word with \
echo "$toto"
echo "\$toto"

# replace character with / (only the first instance)
echo "${toto/O/BABA}"