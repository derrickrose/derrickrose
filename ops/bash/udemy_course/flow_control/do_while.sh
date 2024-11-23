#!/bin/bash

VAR=0

while [[ $VAR -lt 10 ]]
do
  echo $VAR
  let VAR++
done
