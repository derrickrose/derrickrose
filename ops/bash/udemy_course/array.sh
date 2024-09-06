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
echo ${VAR_ARRAY[@]}
echo ${!VAR_ARRAY[@]}
VAR_ARRAY+=(["toys"]="cin")
echo ${VAR_ARRAY[@]}
echo ${#VAR_ARRAY[@]}
unset VAR_ARRAY
echo $VAR_ARRAY