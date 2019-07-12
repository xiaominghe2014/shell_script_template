#!/usr/bin/env bash
: << !
this shell script for kill processes by key word,
You can replace $_key_word with the value you need 
!
if [ $# -ge 1 ];then
  _key_word=$1
else
  cat << EOF
    put int key-words please:
EOF
  read _key_word
  echo
fi 
kill_processes() {
  ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}
find_processes() {
  ps -ef | grep $1 | grep -v grep | awk '{print NR"\t"$2"\t"$8}'
}

kp_i(){
  lsof -i:$1 | awk '{if (NR>1) print $2}'|xargs kill -9
}

alias kp=kill_processes
alias fp=find_processes

result=$(kp $_key_word)
echo $result
exit 0