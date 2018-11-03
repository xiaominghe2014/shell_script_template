#!/usr/bin/env bash
: << !
this shell script for macOSX system kill all finders
!
# kill finder for mac
kill_all_finder() {
    rm -rf ~/L*/S*/*finder.savedState
    killall Finder
}

kill_all_finder

exit 0