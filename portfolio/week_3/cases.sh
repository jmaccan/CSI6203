#!/bin/bash

# Author: J Maccan
# Date: Auguest 2019
# Version: NA

# Print Options Menu
echo ""
echo "OPTIONS MENU"
echo "------------------"
echo "1 - Create Folder"
echo "2 - List Files"
echo "3 - Copy Folder"
echo "4 - Save Password"
echo "5 - Read Password"
echo "6 - Print Newest File"
echo "------------------"

# Read user Selection from menu
read -p "Enter number from menu: " usrSel

# Case statement to execute menu selection
case $usrSel in
    "1") # Option 1 from Menu is selected - Execute following case
        echo "1 selected - Create Folder"
        read -p "Type name folder you'd like to create: " folderName
        mkdir ./$folderName;;
    "2") # Option 2 from Menu is selected - Execute following case
        echo "2 selected - List Files from folder"
        read -p "Type directory you'd like to list contents of: " dirName
        ls $dirName;;
    "3") # Option 3 from Menu is selected - Execute following case
        echo "3 selected - Copy a Folder"
        read -p "Enter directory to copy " folderName
        if [ -d "$folderName" ]; then
            read -p "Dir for copied folder: " newDir
            cp -r "$folderName" "$newDir"
        else
            echo "Unable to copy folder - Folder not found - $folderName"
        fi;;
    "4") # Option 4 from Menu is selected - Execute following case
        echo "4 selected - Save a Password"
        read -s -p "Enter a password: " mysec
        echo $mysec >> ./$folderName/secret.txt;;
    "5") # Option 5 from Menu is selected - Execute following case
        echo "5 selected - Read a Password"
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
        fi;;
    "6") # Option 6 from Menu is selected - Execute following case
        echo "6 selected - Print newest file (3 files as Args required)"
        #if arg count doesnt equal 3, exit with error msg
        if [ ! $# -eq 3 ]; then
            echo "3 args not supplied"
            exit 1
        fi

        # check each arg that its of type file
        for var in "$@"
        do
            if [ ! -f "$var" ]; then
                echo "Not all args are files"
                exit 1
            fi
        done
        # tests for newest file
        if [ $1 -nt $2 ] && [ $1 -nt $3 ]; then
            echo "$1 is the newest file"
        elif [ $2 -nt $1 ] && [ $2 -nt $3 ]; then
            echo "$2 is the newest file"
        elif [ $3 -nt $2 ] && [ $3 -nt $1 ]; then
            echo "$3 is the newest file"
        fi;
esac
exit 0
        
        





