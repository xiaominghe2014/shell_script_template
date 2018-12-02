#!/usr/bin/env bash
: << !
this shell script for progress eg. 
!

progress() {
    local w=45 p=$1;  shift
    # create a string of spaces, then change them to dots
    printf -v dots "%*s" "$(( $p*$w/100 ))" ""; dots=${dots// /#};
    # print those dots on a fixed-width space plus the percentage etc. 
    printf "\r\e[K[%-*s] (%3d %%) %s" "$w" "$dots" "$p" "$*"; 
}

test_progress(){
# test loop
    s=...
    for x in `awk 'BEGIN{ for(i=0;i<=100;i++) print i}'`; do
        p=${s:0:$(($x%${#s}))+1}
        end_str="tring to loading"$p
        if [ $x == 100 ];then 
            end_str="finished"
        fi
        progress "$x" $end_str
        t=$(LC_CTYPE=C tr -cd 0-9  </dev/urandom| head -c 1)
        sleep .$t  # do some work here
    done ; echo
}

test_progress