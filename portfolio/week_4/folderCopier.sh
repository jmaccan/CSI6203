#!/bin/bash

# Author: J Maccan
# Date: Auguest 2019
# Version: NA

# Description: Create new folder by copy existing folder into new location.
# Esnure folder to be copied exists

read -p "Folder to copy " folderName

if [ -d "$folderName" ]; then
    read -p "Dir for copied folder: " newDir
    cp -r "$folderName" "$newDir"
else
    echo "Unable to copy folder - Folder not found - $folderName"
fi



