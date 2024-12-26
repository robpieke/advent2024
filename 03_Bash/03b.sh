#!/usr/bin/env bash

regex_mul="mul\(([0-9]+),([0-9]+)\)"
regex_do="do\(\)"
regex_dont="don't\(\)"

sum=0
data=$(<input.txt)
on=1
while [[ $data =~ $regex_mul|$regex_do|$regex_dont ]]; do
    if [ "${BASH_REMATCH[0]}" = "do()" ]; then
        on=1
    elif [ "${BASH_REMATCH[0]}" = "don't()" ]; then
        on=0
    elif [ "$on" = "1" ]; then
        let sum+=${BASH_REMATCH[1]}*${BASH_REMATCH[2]}
    fi
    data=${data#*${BASH_REMATCH[0]}}
done

echo $sum
