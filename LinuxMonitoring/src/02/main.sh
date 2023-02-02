#!/bin/bash
#### Description: Prints current system information
#### Only one argument must be used

function save_to_file {
    read -p "Do you want to save data into file? (Y/N): " answer
    if [[ $answer = Y || $answer = y ]]
    then
        file=$(date +"%d_%m_%Y_%H_%M_%S".status)
        var=1
    for str in "$str_1" "$str_2" "$str_3" "$str_4" "$str_5" "$str_6" "$str_7"\
    "$str_8" "$str_9" "$str_10" "$str_11" "$str_12" "$str_13" "$str_14" "$str_15"\
    "$str_16"
        do
            echo $str >> $(date +"%d_%m_%g_%H_%M_%S").status
        done
    fi
}

if [[ $# -eq 0 ]] 
then 
    chmod +x ./system_status.sh
    . ./system_status.sh
    system_status_print
    save_to_file
else
    echo "Error: wrong number of arguments"
    echo "Usage: $0"
fi