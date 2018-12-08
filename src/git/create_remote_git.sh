#!/usr/bin/env bash
: << !
this shell script for git create a remote repo
!

# get the detailed on https://developer.github.com/v3/repos/#create
# eg. create_remote_repository <repository name> <Authorization>

create_remote_repository(){
    name=$1
    token=$2
    data="{\"name\": \"${name}\", \"private\": false, \"auto_init\":true, \"license_template\":\"mit\"}"
    curl -H "Authorization: token ${token}" -H "Content-Type:application/json" -X POST -d "${data}" https://api.github.com/user/repos
} 