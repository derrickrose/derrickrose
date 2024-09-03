#!/bin/bash

# to find out user and group names and numerical IDs
id
id root
id frils

# to find the name of the machine
hostname

# to find out information about operating system running on the machine
uname
uname -a

# to find out the current logged in user (user shell time)
who
whoami

# list content of a dir
ls

# create a dir
mkdir test_baba

# change current directory
cd test_baba

# print the path of current directory
pwd

# create a file
touch test_file
echo "aaa" > test_file #add text in a file but also create it if doesnt exist
date +%d-%m-%Y >> test_file # print the formatted date and redirect it at the end of file
cat test_file # print content of the file

# copy a file
cp test_file test_file_copy
cat test_file_copy
ls

# move file (rename or here overwrite the existing)
mv test_file_copy test_file
ls # there should be only one file left

# delete a file
rm test_file

# change directory get back to the parent
cd ..

# remove directory
rmdir test_baba

# cut subsequence of words from a text , start from index 1
echo "baba bobo baba" | cut -c 6-10






