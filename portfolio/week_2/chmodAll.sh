#!/bin/bash

# Author: J Maccan
# Date: Auguest 2019
# Version: NA

# Script to recrusivley update permissions on all SH files in multiple folders
echo "updating all permissions in SH files in weeks 1,2,3 folders"
chmod +x ~/CSI6203/portfolio/week_1/*.sh
chmod +x ~/CSI6203/portfolio/week_2/*.sh
chmod +x ~/CSI6203/portfolio/week_3/*.sh
cd ~/CSI6203/
tree
echo 'Done'