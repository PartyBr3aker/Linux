#!/bin/bash
function set_background() {
    if [[ $1 -eq 1 ]]
    then
        eval "$2='$white_backgr'"
    elif [[ $1 -eq 2 ]]
    then
        eval "$2='$red_backgr'"
    elif [[ $1 -eq 3 ]]
    then
        eval "$2='$green_backgr'"
    elif [[ $1 -eq 4 ]]
    then
        eval "$2='$blue_backgr'"
    elif [[ $1 -eq 5 ]]
    then
        eval "$2='$purple_backgr'"
    elif [[ $1 -eq 6 ]]
    then
        eval "$2='$black_backgr'"
    fi
}

function set_font() {
    if [[ $1 -eq 1 ]]
    then
        eval "$2='$white_font'"
    elif [[ $1 -eq 2 ]]
    then
        eval "$2='$red_font'"
    elif [[ $1 -eq 3 ]]
    then
        eval "$2='$green_font'"
    elif [[ $1 -eq 4 ]]
    then
        eval "$2='$blue_font'"
    elif [[ $1 -eq 5 ]]
    then
        eval "$2='$purple_font'"
    elif [[ $1 -eq 6 ]]
    then
        eval "$2='$black_font'"
    fi
}