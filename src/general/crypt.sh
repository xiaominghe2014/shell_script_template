#!/usr/bin/env bash
: << !
this shell script for encrypt eg. 
!

encrypt_ascii(){
    e_ascii=$(echo $1|tr '\041-\176' '\170-\176\041-\167')
    echo $e_ascii
    d_ascii=$(echo $e_ascii|tr '\170-\176\041-\167' '\041-\176')
    echo $d_ascii
}


decrypt_ascii(){
    d_ascii=$(echo $1|tr '\170-\176\041-\167' '\041-\176')
    echo $d_ascii
    e_ascii=$(echo $d_ascii|tr '\041-\176' '\170-\176\041-\167')
    echo $e_ascii
}

encrypt_ascii $1
decrypt_ascii $1