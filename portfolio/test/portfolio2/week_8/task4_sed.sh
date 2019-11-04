#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA
# Description:
# Module 8 Task 4 - Using sed to only affet matched patters

#sed

sed -n '/echo .*".*!"/ s/Correct/Right/p' ../week_6/guessingGame.sh

sed -rn 's/echo.*"(.*)"/\1/p' ../week_6/*.sh > output.txt


