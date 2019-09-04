#!/bin/bash

# Author: J Maccan
# Date: Auguest 2019
# Version: NA

#prompt for file to move
read -p "Enter file to move " file

#test if file exists
if [ -f "$file" ]; then
    #prompt for new loc
    read -p "Enter new location for file: " newDir
    #move file to new loc
    mv $file $newDir
else
    #err msg if file does not exist
    echo "File: $file does not exist"
fi



