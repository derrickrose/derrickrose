#!/bin/bash

# character classes
# [[:digit:]] [0-9]
# [[:lower:]] [a-z]
# [[:upper:]] [A-Z]
# [[:alpha:]] [a-zA-Z]
# [[:alnum:]] [0-9a-zA-Z]
# [[:xdigit]] [0-9a-fA-F] (base 16)
# [[:cntrl]] control characters - first 32 ascii characters and 127th DEL
# [[:punct:]] all the punctuation characters
# [[:graph]] [[:alnum:]] and [[:punct:]]
# [[:print:]] [[:alnum]] [[:punct:]] and space
# [[:blank:]] space and tab
# [[:space:]] white space character same as \s

#example of use
#echo -n "click on any digit "
#read VAR
#if [[ $VAR =~ [[:digit:]] ]]
#then
#  echo "you actually hit on a digit $VAR"
#else
#  echo "you did not hit on a digit"
#fi
#
#cat << FIN > toto
#shhsk shjjs h hsh lla   11
#224 5894 5585 5555 jijis haoo jsio
#884s hs  hshhj dkauii shh alsp aiis
#ppii llm kkj kkkooo  iioo
#ezc  hhj  kk  kcxv
#mmmpppppkkkllllll
#FIN
#
#cat toto | grep [[:xdigit:]]


# example of use validation of email address with .com
# example of use validation of ip address

cat <<FIN > toto
toto@hotmail.com tata
tata@123.com sfsf
baba@gmail.com sdfs
nico@123.cx sdfs
tare.otc@toto.fr  sdfsf
FIN
cat toto | grep -E [[:alnum:]]@[[:lower:]] | grep .com | cut -d" " -f1



echo -n "[+] Enter the IP address : "
read IP
REGEX="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[[:digit:]]{1,3}"
if ! [[ $IP =~ $REGEX ]]
then
  echo "This is not an ip address : $IP"
  exit 1
else
  echo "This is a valid IP address"
fi

IP_ADDRESS=${BASH_REMATCH[0]} #take the actual match and give value to the new variable
ping -c 10 $IP_ADDRESS > toto
cat toto
rm -rf toto

# another example of use is to match credit card
