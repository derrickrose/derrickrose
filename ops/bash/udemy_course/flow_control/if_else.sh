#!/bin/bash

# conditions
# equals to [ $VAR == $VAR_2 ]
# equals to [ $VAR -eq $VAR_2 ]
# not equals to [ $VAR != $VAR_2 ]
# not equals to [ $VAR -ne $VAR_2 ]
# less than [ $VAR -lt $VAR_2 ]
# greater than [ $VAR -gt $VAR_2 ]
# less than or equals to [ $VAR -le $VAR_2 ]

# greater than or equals to [ $VAR -ge $VAR_2 ]
# AND [ x ] && [ y ] while x and y are both conditions
# OR [ x ] || [ y ]

VAR=1
VAR_2=2
if [ $VAR -ge $VAR_2 ]
then echo "var is equals to VAR_2"
else echo "var is not equals to VAR_2"
fi
# more on maths
# conditions on number or arguments
if [ $# != 2 ]
then echo "number of arguments must be 2 "
fi
echo $#
# string comparison
# we can just use [ "$str1" = "$str2" ] (one equal only and variables quoted) can be use too 2 equals
str1="hello"
str2="hello"
if [ "$str1" = "$str2" ]
then echo "strings are same"
else echo "string are not same"
fi
# string empty with -z or not empty with -n
VAR2=""
if [ -z "$VAR2" ]
then echo "var2 empty"
else echo "var2 not empty"
fi
if [ -n "$VAR2" ]
then echo "var2 is not empty"
else echo "var2 is empty"
fi
# check if its a root user
if [ $UID != 0 ] #uid of root is 0
then echo "you must be root user to run this"
fi

# if elif else and regex
echo enter a number
read VAR
if [ $VAR -lt 0 ] 2> /dev/null #redirect error to black hole since  the user could enter letter instead
then echo "var is negatif"
elif [ $VAR == 0 ] 2> /dev/null
then echo "var is 0"
elif [ $VAR == 1 ] 2> /dev/null
then echo "var is 1"
elif [[ $VAR =~ [A-Z,a-z] ]]
then echo "|$VAR| is not a number, you had to enter a number "
else echo "var is greater than 1"
fi

# condition verif if dir exist, if not create it and cd in it and print the dir and back to parent
DIR="directory"
test -d $DIR || mkdir $DIR && cd $DIR && pwd && cd ..
rm -rf $DIR