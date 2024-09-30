#!/bin/bash

# use time ./script to test time of execution

REGEX=.sh

for file in *
do
  if [[ $file =~ $REGEX ]]
    then cp $file $HOME
  fi
done