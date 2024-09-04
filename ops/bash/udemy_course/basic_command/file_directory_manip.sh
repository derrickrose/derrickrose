#!/bin/bash


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

# determine file type
file test_file

# copy a file
cp test_file test_file_copy
cat test_file_copy
ls

# move file (rename or here overwrite the existing)
mv test_file_copy test_file
ls # there should be only one file left

# count number of lines, words or characters in a file
echo word_count
wc -m test_file

# show texts that fits on the screen current screen size, but can scroll down
# less test_file

# show the latest 5 lines of a file
tail test_file

# print first 5 lines of a file
head test_file

# delete a file
rm test_file

# change directory get back to the parent
cd ..

# remove directory
rmdir test_baba

# cut subsequence of words from a text , start from index 1
echo "baba bobo baba" | cut -c 6-10


