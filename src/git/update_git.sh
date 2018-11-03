#!/usr/bin/env bash
: << !
this shell script for git pull the The latest code of remote repo
!

# 1.check arguments
if [ $# -lt 3 ];then
	echo "arguments error, please use script as follows" 1>&2
    echo "usage: sh ./update_git.sh [branch] [remote url] [dir]" 1>&2
    exit 1
else
    echo "
    _branch=$1 
    _remote=$2  
    _dir=$3
    "
fi
_branch=$1
_remote=$2
_dir=$3

# 2.check dir
_base_dir=$(cd `dirname $0`; pwd)
if [ -d $_dir ];then
	echo "ok , has $_dir directory"
    cd $_dir
    echo "dir====>$_dir"
    remote=$(git remote -v)
    echo "remote---$remote"
    if [[ $remote == *$_remote* ]]; then
        echo "git has already exist..."
    else
        # find $_dir/ -maxdepath 1 -type d -name "<Directory>" -exec rm -rf {} \;
        # find $_dir/ -maxdepath 1 -type f -name "<file>" -exec rm -f {} \;
        cd $_base_dir
        echo "dir====>$_base_dir"
        rm -rf $_dir
        git clone -b $_branch $_remote $_dir
        cd $_dir
        echo "dir====>$_dir"
    fi
else
    git clone -b $_branch $_remote $_dir
    cd $_dir
    echo "dir====>$_dir"
fi

# 3.get latest code
    git config core.ignorecase false
    # check branch
    all_branch=$(git branch)
    if [[ $all_branch == *$_branch* ]]; then
        echo "$_branch already exist..."
    else
        echo "$_branch not exist..."
        git branch $_branch
    fi
    git branch --set-upstream-to=origin/$_branch $_branch
    git reset --hard origin/$_branch
    git clean -df .
    git checkout $_branch
    git pull
cd $_base_dir
echo "dir====>$_base_dir"
exit 0