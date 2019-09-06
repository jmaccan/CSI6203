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
        echo "6 selected - Print newest file"

        #Prompt for 3 file names
        read -p 'Enter 1st file name: ' f1
        read -p 'Enter 2nd file name: ' f2
        read -p 'Enter 3rd file name: ' f3

        if [ ! -f "$f1" ] || [ ! -f "$f2" ] || [ ! -f "$f3" ]; then
            echo "Entered names are not all files"
        else
            # tests for newest file
            if [ $f1 -nt $f2 ] && [ $f1 -nt $f3 ]; then
                echo "$f1 is the newest file"
            elif [ $f2 -nt $f1 ] && [ $f2 -nt $f3 ]; then
                echo "$f2 is the newest file"
            elif [ $f3 -nt $f2 ] && [ $f3 -nt $f1 ]; then
                echo "$f3 is the newest file"
            fi;
        fi
esac
exit 0
        
        





