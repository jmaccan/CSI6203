#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA
# Description:
# Module 9 Task 1 - AWK Format for Shopping list

echo 'Shopping List:'

awk 'BEGIN{ FS="," }{ print $1 }' shopping.csv


