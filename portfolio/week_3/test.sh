#!/bin/bash

# Author: J Maccan
# Date: Auguest 2019
# Version: NA

# Description: Create new folder by copy existing folder into new location.
# Esnure folder to be copied exists

read -p "Folder to copy " folderName
echo "Folder name is: $folderName"

if [ -d "$folderName" ]; then
    echo "Folder Exists"
else
    echo "Folder does not exist"
fi



