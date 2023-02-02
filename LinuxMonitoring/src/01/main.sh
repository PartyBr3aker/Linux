#!/bin/bash
#### Description: Prints argument if it is not a number
#### Only one argument must be used

if [[ $# -ne 1 ]]
then
    echo "Error: wrong number of arguments"
    echo "Usage: $0 arg1"
else
    number='^-?[[:digit:]]+([.][[:digit:]]+)?([e][+-][[:digit:]]+)?$'
    if [[ $1 =~ $number ]];
    then
        echo "Error: argument must be a string"
        echo "Usage: $0 arg1"
    else
        echo $1
    fi
fi