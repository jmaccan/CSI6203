#!/bin/bash

#Author: J Maccan
#Date: Auguest 2019
#Version: NA

#Description: This script will print out every 3rd number from 1 to 1000

# create specified number of folder
for ((i = 1; i <= 1000; i+=3)); do
    echo $i
done
exit 0

