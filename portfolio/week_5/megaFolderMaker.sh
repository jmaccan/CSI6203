#!/bin/bash

#Author: J Maccan
#Date: Auguest 2019
#Version: NA

#Description: This script will create multiple folders for the portfolio using iteration

#check for 2 arguments
if (( $#!=2 )); then
    echo " 2 numbers must be provided" && exit 1
fi

# create specified number of folder
for ((i = $1; i <= $2; i++)); do
    echo "creating dir called week_$i"
    mkdir "week_$i"
done
exit 0

