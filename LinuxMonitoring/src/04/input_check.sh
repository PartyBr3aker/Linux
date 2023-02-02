#!/bin/bash
source color_config.conf
source ./../03/system_status.sh
source ./../03/color_set.sh

function check_input() {
    if [[ $# -ne 0 ]]
    then
        echo "Error: wrong number of arguments"
        echo "Usage: $0"
    else
        bgr1=$column1_background
        font1=$column1_font_color
        bgr2=$column2_background
        font2=$column2_font_color
        if [[ -z $bgr1 ]]
        then
            bgr1=1
            color1="default"
        else
            color1=$bgr1
        fi
        if [[ -z $font1 ]]
        then
            font1=6
            color2="default"
        else
            color2=$font1
        fi
        if [[ -z $bgr2 ]]
        then
            bgr2=1
            color3="default"
        else
            color3=$bgr2
        fi
        if [[ -z $font2 ]]
        then
            font2=6
            color4="default"
        else
            color4=$font2
        fi
        check_boundaries $bgr1 $font1 $bgr2 $font2
    fi
}

function check_boundaries() {
    number="^[1-6]$"
    if [[ $1 =~ $number ]] && [[ $2 =~ $number ]] && [[ $3 =~ $number ]] && [[ $4 =~ $number ]] 
    then
        check_color $1 $2 $3 $4
    else
        echo "Error: wrong parameter $i value"
        echo "please, edit the color_config.conf file"
        echo "1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black"
        echo "default scheme 1 6 1 6"
        exit 1
    fi
}

function check_color() {
    if [[ $1 -eq "$2" || $3 -eq "$4" ]]
    then
        echo "Error: background and font have the same value"
        echo "please, edit the color_config.conf file"
        echo "1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black"
        echo "default scheme 1 6 1 6"
        exit 1
    else
        set_background "$1" bgr1
        set_background "$3" bgr2
        set_font "$2" font1
        set_font "$4" font2
        system_status_print
        echo ""
        print_color_configuration  
    fi
}
