#!/bin/bash

#Author: J Maccan
#Date: August 2019
#Version: NA

# Description: Count num of args

if [ $# -eq 3 ] && [ -f $* ]; then
    if [ $1 -nt $2 ] && [ $1 -nt $3 ]; then
        echo "$1 is the newest file"
    elif [ $2 -nt $1 ] && [ $2 -nt $3 ]; then
        echo "$2 is the newest file"
    elif [ $3 -nt $2 ] && [ $3 -nt $1 ]; then
        echo "$3 is the newest file"
    fi
else
    echo "Arg Err"
    exit 1
fi
exit 0



