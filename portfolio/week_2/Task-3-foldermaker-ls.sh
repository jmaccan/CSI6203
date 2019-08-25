#!/bin/bash

#Author: J Maccan
#Date: Auguest 2019
#Version: NA

#Description: This script will prompt a user for a new
#folder name and create that folder in the users $HOME/
#portfolio directory and then list details of the folder

read -p "Type name folder you'd like to create: " folderName
mkdir ./$folderName
ls -l ./$folderName
