#!/bin/bash

# Author: J Maccan
# Date: Auguest 2019
# Version: NA

# Print Options Menu
echo ""
echo "OPTIONS MENU"
echo "------------------"
echo "1  - Create Folder"
echo "2  - List Files"
echo "3  - Copy Folder"
echo "4  - Save Password"
echo "5  - Read Password"
echo "6  - Print Newest File"
echo "7  - Copy Folder using userInput.txt"
echo "8  - Calculator"
echo "9  - Mega Folder Maker"
echo "10 - 1-10000 loop"
echo "11 - For each in Filenames.txt"
echo "12 - Internet Downloader"
echo "13 - Exit"
echo "------------------"

# Read user Selection from menu
read -p "Enter number from menu: " usrSel

while [ ! "$usrSel" == "13" ]; do

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
            echo -e "6 selected - Print newest file\n"

            #Prompt for 3 file names
            read -p 'Enter 1st file name: ' f1
            read -p 'Enter 2nd file name: ' f2
            read -p 'Enter 3rd file name: ' f3

            if [ ! -f "$f1" ] || [ ! -f "$f2" ] || [ ! -f "$f3" ]; then
                echo -e "Entered names are not all files\nExiting...\n"
            else
                # tests for newest file
                if [ $f1 -nt $f2 ] && [ $f1 -nt $f3 ]; then
                    echo "$f1 is the newest file"
                elif [ $f2 -nt $f1 ] && [ $f2 -nt $f3 ]; then
                    echo "$f2 is the newest file"
                elif [ $f3 -nt $f2 ] && [ $f3 -nt $f1 ]; then
                    echo "$f3 is the newest file"
                fi;
                echo ''
            fi;;

        "7") #Option 7 - Blank
            echo -e "\nOption 7 does nothing...\n"
            ;;
        "8") #Option 8 - Calculator
            if (( $# != 3 )); then
                # Inform user that calc cannot work unless 3 args are provided
                echo -e '\nCannot perform calculaltor - 3 args not provided\n'
            else
                # Addition
                if [ $2 == "+" ]; then
                    echo -e "\033[34m$(( $1 + $3 ))"
                # Subtraction
                elif [ $2 == "-" ]; then
                    echo -e "\033[32m$(( $1 - $3 ))"
                # Multiplication
                elif [ $2 == "x" ]; then
                    echo -e "\033[31m$(( $1 * $3 ))"
                # Division
                elif [ $2 == "/" ]; then
                    echo -e "\033[35m$(( $1 / $3 ))"
                fi
                # Return color to white
                echo -e "\033[37m"
            fi
            ;;
        "9") #Option 9 - Mega Folder Maker
            if (( $#!=2 )); then
                echo " 2 numbers/args must be provided"
            else
                # create specified number of folder
                for ((i = $1; i <= $2; i++)); do
                    echo "creating dir called week_$i"
                    mkdir "week_$i"
                done
            fi
            ;;
        "10") #Option 10 - 1-10000 loop
            for ((i = 1; i <= 1000; i+=3)); do
                echo $i
            done
            ;;
        "11") #Option 11 - For each in Filenames.txt
            #set Line count var
            lineCount=1
            #set IFS as a newline
            IFS=$'\n'
            # for loop to iterate through each line in the file
            echo -e ''
            for line in $(cat fileNames.txt); do
                #test if file
                if [ -f $line ]; then
                    echo -e "Line $lineCount: \"$line\" is a file"
                # test if dir
                elif [ -d $line ]; then
                    echo -e "Line: $lineCount: \"$line\" is a directory"
                # line is something else
                else
                    echo -e "I dont know what line: $lineCount is ($line)"
                fi
                #increment line count
                let "lineCount+=1"
            done
            echo -e ''
            ;;
        "12") #Option 12 - Internet Downloader
            # User messsage
            echo -e '\nTesting internet Conneciton, please wait...\n'

            # ping known internet address
            ping -c 1 8.8.8.8

            # test previous command exit code
            if (($? == 0)); then
                #prompt for website to DL, or exit
                echo -e '\nInternet seems to be connected\n'
                read -p 'Please type URL to download or type "exit" to quit: ' usrInp
                # while loop for downloading websites and testing for exit option
                while [ ! "$usrInp" == "exit" ]; do
                    #download website
                    wget $usrInp
                    echo -e "\n$usrInp was successfully downloaded\n"
                    read -p 'Please type URL to download or type "exit" to quit: ' usrInp
                done
                echo -e "\nExiting Internet Downloader...\n"
            else
                echo -e 'No internet connection\n'
            fi
            ;;
    esac
    read -p "Enter number from menu: " usrSel
done
echo -e "\nGoodbye!\n"
exit 0






