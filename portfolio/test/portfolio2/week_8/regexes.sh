#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA
# Description:
# Module 8 Task 2 - Regex patterns

echo -e '\033[31m'
echo -e '\nAll sed statements...\n\n'
grep -r --color=always --include \*.sh 'sed' ../
echo -e '\n'

echo -e '\033[34m'
echo -e 'All lines that start with the letter m...\n\n'
grep -r --color=always --include \*.sh '^m' ../
echo -e '\n'

echo -e '\033[32m'
echo -e 'All lines that contain 3 digits...\n\n'
grep -r --color=always -w -P --include \*.sh "\d{3}" ../
echo -e '\n'

echo -e '\033[35m'
echo -e 'All lines that contain loops...\n\n'
grep -E --color=always -r --include \*.sh '(for)|(while)|(until)$' ../
echo -e '\n'

echo -e '\033[36m'
echo -e 'All echo statements with at least 3 words...\n\n'
grep -r -E --color=always --include \*.sh '^echo..(\w+ ){3}' ../
echo -e '\n'

