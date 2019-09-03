#!/bin/bash

#Author: J Maccan
#Date: August 2019
#Version: NA

# Description: This script will read in the contents of a file
# called secret.txt. If unable to access the file, an error
# will be displayed


exec 1< ./secret.txt
read -u 1 a b
echo $a $b


