#!/bin/bash

function print_color_configuration() {
    name_color $font1 font1;
    name_color $font2 font2;
    name_color $bgr1 bgr1;
    name_color $bgr2 bgr2;

    echo "Column 1 background = $color1 ($bgr1)"
    echo "Column 1 font color = $color2 ($font1)"
    echo "Column 2 background = $color3 ($bgr2)"
    echo "Column 2 font color = $color4 ($font2)"

}


function name_color() {
    if [[ $1 == "$white_font" ]] || [[ $1 == "$white_backgr" ]]
    then
    eval "$2='white'"
    elif [[ $1 == "$red_font" ]] || [[ $1 == "$red_backgr" ]]
    then
    eval "$2='red'"
    elif [[ $1 == "$green_font" ]] || [[ $1 == "$green_backgr" ]]
    then
    eval "$2='green'"
    elif [[ $1 == "$blue_font" ]] || [[ $1 == "$blue_backgr" ]]
    then
    eval "$2='blue'"
    elif [[ $1 == "$purple_font" ]] || [[ $1 == "$purple_backgr" ]]
    then
    eval "$2='purple'"
    elif [[ $1 == "$black_font" ]] || [[ $1 == "$black_backgr" ]]
    then
    eval "$2='black'"
    fi
}