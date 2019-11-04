#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA
# Description:
# Module 8 Task 3 - Using regex in scripts

#find triangles with area containing double digits
../week_7/shorterTriangles.sh | grep --colour=always -E 'Area: ([0-9]{2})'


