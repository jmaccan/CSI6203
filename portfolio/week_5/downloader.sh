#!/bin/bash

#Author: J Maccan
#Date: Auguest 2019
#Version: NA

#Description: test internet connection and download website

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
    echo -e "\nExiting...\n"
    exit 0
else
    echo -e 'No internet connection\n'
fi
exit 0




