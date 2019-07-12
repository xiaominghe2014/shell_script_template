#!/usr/bin/env bash
: << !
this shell script for  copy files
!

cp_file_from_to(){
    # 1.check arguments
    if [ $# -lt 3 ];then
	    echo "arguments error, please use script as follows" 1>&2
        echo "usage: sh ./cp.sh [file_type] [source_directory] [target_directory]" 1>&2
        exit 1
    else
        echo "file_type=$1
        source_directory=$2   
        target_directory=$3
        "
    fi
    file_type=$1
    source_directory=$2   
    target_directory=$3
    find ${source_directory} -iname "*.${file_type}" | xargs -I '{}' cp '{}' ${target_directory}
}

cp_file_from_to $*
