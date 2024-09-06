#!/bin/bash

# using let
let RESULT=5+5
echo $RESULT

# using (())
RESULT=$((2*2))
echo $RESULT

# using []
RESULT=$[6+9]
echo $RESULT

# using expr
echo $(expr 300 + 200) #mus have spaces between

# using bc
RESULT=$(echo 800 + 200 | bc)
echo $RESULT

