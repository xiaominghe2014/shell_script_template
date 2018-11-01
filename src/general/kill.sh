#!/usr/bin/env bash
: << !
this shell script for kill processes by key word,
You can replace $_key_word with the value you need 
!
_key_word=$1
echo $_key_word
result=$(ps -ef | grep "$_key_word" | awk '{if (NR>1) {print $2}}'| xargs kill -9)
echo $result
exit 0