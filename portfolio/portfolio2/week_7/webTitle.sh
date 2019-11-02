#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA

# Module 7 Task 5 - download website and print website title

#prompt for website and download location
read -p 'Please type URL to download or type "exit" to quit: ' usrInp
read -e -p "Where would you like to save the website?" usrDir
#download the website
wget -q -P $usrDir $usrInp
#locate the text between the title tags from the website file
site=$(grep -o '<title>.*</title>' $usrDir/index.html | sed 's/\(<title>\|<\/title>\)//g')
echo "You have downloaded the website titled: $site"




