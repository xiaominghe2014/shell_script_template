#!/usr/bin/env bash
: << !
this shell script for macOSX system open chrome allow  cross domain
!
open -a "Google Chrome" --args --disable-web-security  --allow-file-access-from-files --allow-file-access-frome-files

exit 0