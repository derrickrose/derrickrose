#!/bin/bash

# use time ./script to test time of execution

for file in *
do
  if [[ $file = *(*.sh) ]]
    then
      cp $file $HOME
  fi
done


