#!/bin/bash

#Author: J Maccan
#Date: Auguest 2019
#Version: NA

#Description: Calculator

if [ $2 == "+" ]; then
    echo -e "\033[34m$(( $1 + $3 ))"
elif [ $2 == "-" ]; then
    echo -e "\033[32m$(( $1 - $3 ))"
elif [ $2 == "x" ]; then
    echo -e "\033[31m$(( $1 * $3 ))"
elif [ $2 == "/" ]; then
    echo -e "\033[35m$(( $1 / $3 ))"
fi
exit 0