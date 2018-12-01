#!/usr/bin/env bash
: << !
this shell script for progress eg. 
!

progress() {
    local w=80 p=$1;  shift
    # create a string of spaces, then change them to dots
    printf -v dots "%*s" "$(( $p*$w/100 ))" ""; dots=${dots// /.};
    # print those dots on a fixed-width space plus the percentage etc. 
    printf "\r\e[K|%-*s| %3d %% %s" "$w" "$dots" "$p" "$*"; 
}
# test loop
for x in `awk 'BEGIN{ for(i=0;i<=100;i=i+10) print i}'`; do
    progress "$x" still working...
    sleep .1   # do some work here
done ; echo