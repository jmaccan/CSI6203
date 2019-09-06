#!/bin/bash

#Author: J Maccan
#Date: Auguest 2019
#Version: NA

#Description: This script will check each line of a file and respond accordingly

#set Line count var
lineCount=1
#set IFS as a newline
IFS=$'\n'
# for loop to iterate through each line in the file
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

exit 0


