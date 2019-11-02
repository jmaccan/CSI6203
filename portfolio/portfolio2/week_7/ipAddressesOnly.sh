#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA

# Module 7 Task 2 - Manipulating Text

#parse out the ip address lines using sed
./ipInfo.sh | sed -n '/IP Address/ p'


