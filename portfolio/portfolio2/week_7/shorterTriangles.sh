#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA

# Module 7 Task 4 - triangles.sh modified output

#pipe the triagles.sh script into the sed command and perform some subsitutions to alter the printing
../week_6/triangles.sh | sed '{
s/The area for a triangle with a base:/Base:/
s/and height:/Height:/
s/is:/Area:/
}'


