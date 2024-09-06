#!/bin/bash

#declare array
ARRAY=(one two three four five six)
echo "$ARRAY" #get first item of array
echo "${ARRAY[0]}" #get first item of array
echo "${ARRAY[@]}" # get all item of array
echo ${ARRAY[*]} # get all item of array delimited by first element of IFS

#length
echo length of first element ${#ARRAY[0]} #length of the first element
echo length of the array ${#ARRAY[@]} #length of the array
echo index of all elements ${!ARRAY[@]} #all indexes of array
echo index of all elements ${!ARRAY[*]} #all indexes of array


#associative array (may be like map
echo "-------------"
declare -A VAR_ARRAY #to declare associate array
VAR_ARRAY=(["Peter"]="un" ["John"]="deux" ["Toto"]="trois")
echo all values of the array ${VAR_ARRAY[@]}
echo indices of the array ${!VAR_ARRAY[@]}
VAR_ARRAY+=(["toys"]="cin")
echo ${VAR_ARRAY[@]}
echo ${#VAR_ARRAY[@]} # length of the array
unset VAR_ARRAY # empty the array
echo $VAR_ARRAY

#sub-array may refer to string
arr=('zero' "one" "two" "three" "four" "five")
echo print the first two param ${arr[@]:0:2}