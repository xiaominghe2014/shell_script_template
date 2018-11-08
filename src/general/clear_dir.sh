#!/usr/bin/env bash
: << !
this shell script for clear directory. 
!

# only clear all files in directory
clear_all_files() {
    if [ $# -lt 1 ];then
        echo "need directory argument" 1>&2
        exit 1
    fi
    echo "$1"
    _path="$1"
    res_f=$(find "$_path" -type f  -exec rm -f {} \; 2>/dev/null)
    echo $res_f
}

# clear any sub directories in directory
clear_all_subdirs() {
    if [ $# -lt 1 ];then
        echo "need directory argument" 1>&2
        exit 1
    fi
    echo "$1"
    _path="$1"
    res_d=$(find "$_path" -type d  -mindepth 1  -exec rm -rf {} \; 2>/dev/null)
    echo $res_d
}

# clear any files include sub directories in directory
clear_dir() {
    if [ $# -lt 1 ];then
        echo "need directory argument" 1>&2
        exit 1
    fi
    echo "$1"
    _path="$1"
    res=$(find "$_path" -xdev -mindepth 1 -exec rm -rf {} \; 2>/dev/null)
    echo $res
}

clear_dir "$@"