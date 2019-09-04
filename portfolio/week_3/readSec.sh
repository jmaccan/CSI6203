#!/bin/bash

#Author: J Maccan
#Date: August 2019
#Version: NA

# Description: This script will read in the contents of a file
# called secret.txt.

#test if file is readable
if [ -r "./secret.txt" ]; then
    #set input
    input="./secret.txt"
    #read line
    while IFS= read -r line
    do
        #print line
        echo "$line"
    done < "$input"
else
#error if file is uunreadable
echo "Unable to read file"
fi


