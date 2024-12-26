#!/usr/bin/env bash

regex="mul\(([0-9]+),([0-9]+)\)"

sum=0
data=$(<input.txt)
while [[ $data =~ $regex ]]; do
    let sum+=${BASH_REMATCH[1]}*${BASH_REMATCH[2]}
    data=${data#*${BASH_REMATCH[0]}}
done

echo $sum
