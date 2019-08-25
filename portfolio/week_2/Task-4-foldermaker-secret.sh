#!/bin/bash

# Author: J Maccan
# Date: Auguest 2019
# Version: NA

# Description: This script will prompt a user for a new
# folder name and create that folder in the PWD
# A password will then be requested from the user
# which will be stored in plaintext in a text file in the
# newly created folder

read -p "Type name folder you'd like to create: " folderName
mkdir ./$folderName
read -s -p "Enter a password: " mysec
echo $mysec >> ./$folderName/secret.txt
echo


