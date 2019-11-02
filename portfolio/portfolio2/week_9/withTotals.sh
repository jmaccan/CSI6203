#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA
# Description:
# Module 9 Task 3 - AWK Shopping list with totals

echo 'Shopping List:'

awk '
    BEGIN{ FS=","; currency="$"; print "Item       | Qty  | Price  |  Total"; print "------------------------------------" }
    { printf "%-10s | %-4s | %c%02.2f  | %c%02.2f\n", $1, $2, currency, $3, currency, (( $2 * $3 )) }
    END{ print "The End" }
    ' ./shopping.csv


