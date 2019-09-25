#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA

# Module 7 Task 3 - Script to add lines to a file

sed -i '/Linux/ i\The next line contains the work Linux' $1
echo -e 'Editing file...\nDone!'


