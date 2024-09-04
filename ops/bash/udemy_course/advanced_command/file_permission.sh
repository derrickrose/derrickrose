#!/bin/bash

# default permission when creating a file is :
#-rw-rw-r
#-user-group-other user is the owner
#-6-6-4

echo "a b c" > text.txt
ls -al text.txt
chmod a+x text.txt # add execute to all
chmod u+x text.txt # add execute to user (owner)
chmod o+x text.txt # add execute to other
ls -al text.txt
rm text.txt
