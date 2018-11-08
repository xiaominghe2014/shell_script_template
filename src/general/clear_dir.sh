#!/usr/bin/env bash
: << !
this shell script for clear directory. 
!

clear_dir() {
    if [ $# -lt 1 ];then
        echo "need directory argument" 1>&2
        exit 1
    fi
    echo "$1"
    _path="$1"
    res_f=$(find "$_path" -type f  -mindepth 1  -exec rm -f {} \; 2>/dev/null)
    echo $res_f
    res_d=$(find "$_path" -type d  -mindepth 1  -exec rm -rf {} \; 2>/dev/null)
    echo $res_d
}

clear_dir "$@"