#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA
# Description:
# Module 9 Task 2 - AWK Shopping list

echo 'Shopping List:'

awk '
    BEGIN{ FS=","; currency="$"; print "Item       | Qty  | Price"; print "------------------------------" }
    { printf "%-10s | %-4s | %c%02.2f\n", $1, $2, currency, $3 }' shopping.csv


