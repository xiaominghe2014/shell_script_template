#!/usr/bin/env bash
: << !
this shell script for macOSX system link to command,
You can replace $_target,$_src,$_app  with the value you need 
!
_target=/usr/local/bin/code
_src=Contents/Resources/app/bin/code
_app="Visual Studio Code.app"
if [ -h "$_target" ]; then
    echo "command $_target  already exists
    if necessary, pelase deleted and then execute this shell script
    Option eg: sudo rm -rf $_target" 1>&2
    exit 1
fi
result=$(mdfind "$_app" | grep "$_app")
echo $result
if [ ! -d "$result" ]; then
    echo "Directory does not exist!" 1>&2
    exit 1
fi
ln -s "$result/$_src" "$_target"
exit 0