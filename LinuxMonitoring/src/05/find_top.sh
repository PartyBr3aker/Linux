#!/bin/bash
function find_top_directories() {
    output=$(du -h "$1" | sort -rh | head -5 | awk '{print" - "$2", "$1}')
    IFS=$'\n'
    counter=0
    for var in $output
    do
        ((counter +=1))
    echo "$counter $var"
    done
}

function find_top_files() {
    output="$(find "$1" -type f -not -path '*/\.*' -exec du -h {} + 2>/dev/null | sort -hr | head -n 10 )"
    IFS=$'\n'
    counter=0
    for var in $output
    do
        ((counter += 1))
        file=$(echo "$var" | awk '{print $2}')
        size=$(echo "$var" | awk '{print $1}' | sed -e 's:K: Kb:g' | sed 's:M: Mb:g' | sed 's:G: Gb:g' )
        type=$(echo "$var" | awk '{ tp=split($2,type,".") ; print type[tp] }' )
        printf "%d - %s, %s, %s\n" $counter "$file" "$size" "$type"
    done
}

function find_top_exe() {
    output="$(find "$1" -type f -executable -not -path '*/\.*' -exec du -h {} +  2>/dev/null | sort -hr | head -n 10 )"
    IFS=$'\n'
    counter=0
    for var in $output
    do
        ((counter += 1))
        path=$(echo "$var" | awk '{print $2}')
        size=$(echo "$var" | awk '{print $1}' | sed -e 's:K: Kb:g' | sed 's:M: Mb:g' | sed 's:G: Gb:g' )
        md5=$(md5sum "$path"|  awk '{print $1}')
        printf "%d - %s, %s, %s\n" $counter "$path" "$size" "$md5"
    done
}
