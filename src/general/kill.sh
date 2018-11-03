#!/usr/bin/env bash
: << !
this shell script for kill processes by key word,
You can replace $_key_word with the value you need 
!
_key_word=$1
echo $_key_word
kill_processes() {
  ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}
find_processes() {
  ps -ef | grep $1 | grep -v grep | awk '{print $2" "$8}'
}

alias kp=kill_processes
alias fp=find_processes

result=$(kp $_key_word)
echo $result
exit 0