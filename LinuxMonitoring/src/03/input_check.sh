#!/bin/bash

function check_input() {
    if [[ $# -ne 4 ]]
    then
        echo "Error: wrong number of arguments"
        usage
    else
        check_boundaries "$@"
    fi
}

function check_boundaries() {
    number="^[1-6]$"
    if [[ $1 =~ $number ]] && [[ $2 =~ $number ]] && [[ $3 =~ $number ]] && [[ $4 =~ $number ]] 
    then
        check_color "$@"
    else
        echo "Error: wrong parameter $i value"
        usage
        exit 1
    fi
}

function check_color() {
    if [[ $1 -eq "$2" || $3 -eq "$4" ]]
    then
        echo "Error: background and font have the same value"
        usage
        exit 1
    else
        set_background "$1" bgr1
        set_background "$3" bgr2
        set_font "$2" font1
        set_font "$4" font2
        system_status_print
    fi
}

function usage() {
    echo "Usage: $0 arg1 arg2 arg3 arg4. All arguments must be numbers from 1 to 6"
    echo "arg1 header back; arg2 header font; arg3 value back; arg4 value font"
    echo "arg1 shoud not be equal to arg2; arg3 shoud not be equal to arg4"
    echo "1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black"

}