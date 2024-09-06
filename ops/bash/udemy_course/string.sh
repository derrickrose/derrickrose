#!/bin/bash

# replacing WORLD by world
VAR="HELLOworld"
echo $VAR
echo ${VAR/WoRLD/world}
echo $VAR | tr "WORLD" "world"

# substring
echo ${VAR:0:5} # substring start from 0 to 5 excluded
echo ${VAR::5} # same as 0 to 5
echo ${VAR:5} # substring and take last 5 char

#to upper case
echo ${VAR^^}

#to lower case
echo ${VAR,,}
echo ${VAR,} # lowercase just first letter
var="bonjour le jour"
echo ${var^} # uppercase just first letter

