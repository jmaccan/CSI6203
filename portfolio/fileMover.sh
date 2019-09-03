#!/bin/bash

# Author: J Maccan
# Date: Auguest 2019
# Version: NA

# Description: Create new folder by copy existing folder into new location.
# Esnure folder to be copied exists

read -p "Enter file to move " file

if [ -f "$file" ]; then
    read -p "Enter new location for file: " newDir
    mv $file $newDir
else
    echo "File: $file does not exist"
fi



