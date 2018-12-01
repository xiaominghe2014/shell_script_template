#!/usr/bin/env bash
: << !
this shell script for find eg. 
also sometimes as follow:
find $dir -name/iname "pattern1" -o -name/iname "pattern2" | xargs grep "key words" -n
!

find_all() {
    arg_count=$#
    if [ $arg_count -ge 5 ];then
        arg_count=5
    fi
    case "$arg_count" in
        "0")
            echo "Arguments Error: 
            eg. find_all [name] [dir] [type:d|f] 
                         [maxdepth:number] [commond]
            " 1>&2
            ;;
        "1")
            res=$(find . -name "$1" 2>/dev/null)
            echo $res
            ;;
        "2")
            res=$(find $2 -name "$1" 2>/dev/null)
            echo $res
            ;;
        "3")
            res=$(find $2 -type $3 -name "$1" 2>/dev/null)
            echo $res
            ;;
        "4")
            res=$(find $2 -type $3  -maxdepth $4 -name "$1" 2>/dev/null)
            echo $res
            ;;
        "5")
            res=$(find $2 -type $3  -maxdepth $4 -name "$1" -exec $5 {} \; 2>/dev/null)
            echo $res
            ;;
    esac
}

find_all $*