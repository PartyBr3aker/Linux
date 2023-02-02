#!/bin/bash
#### Description: Prints information about a directory
#### Only one argument must be used
chmod +x ./print_results.sh
. ./print_results.sh

function check_input() {
    if [[ $# -ne 1 ]]
    then
        echo "Error: wrong number of arguments"
        echo "Usage: $0 arg1; arg1 should be a path to a directory"
        exit 1
    else
        if ! [[ $1 =~ /$ ]]
        then
            echo "Error: argument should be a path (should end with '/')"
            exit 1
        else
            if ! [[ -d "$1" ]]
            then
                echo "Error: no such directory"
                exit 1
            else
                print_directory_info "$1"
            fi
        fi
    fi
}

check_input "$@"