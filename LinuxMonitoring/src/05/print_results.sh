#!/bin/bash
chmod +x ./find_top.sh
. ./find_top.sh

function print_directory_info() {
    time=$(date +%s)
    dir=$(find "$1" -type d |wc -l)
    echo "Total number of folders, including subfolders = $(($dir-1))"
    echo "Top 5 folders with largest size in descending order (path and size):"; find_top_directories "$1"
    echo "Total number of files = "$(find "$1" -type f|wc -l)""
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $(find "$1" -name "*.conf" | wc -l)"
    echo "Text files = $(find "$1" -name "*.txt" | wc -l)"
    echo "Executable files = $(find "$1" -type f -executable | wc -l)"
    echo "Log files (with the extension .log) = $(find "$1" -name "*.log" | wc -l)"
    echo "Archives = $(find "$1" -name "*.tar"| wc -l)"
    echo "Symolic links = $(find "$1" -type l | wc -l)"
    echo "Top 10 files with largest size in descending order (path, size and type):"; find_top_files "$1"
    echo "Top 10 executable files with largest size in descending order (path, size and hash):"; find_top_exe "$1"
    echo "Execution time of the script (in seconds) = $(($(date +%s)-$time))"
}