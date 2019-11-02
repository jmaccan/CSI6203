#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA
# Description:
# Module 8 Task 5 - Example Web Scraper

echo -e '\033[31m'
echo -e 'Curl only'
curl -s http://example.com

echo -e '\033[32mWesbite title:'
curl -s http://example.com | sed -Ern 's/<title>(.*)<\/title>/\1/p' | sed 's/^ *//'

echo -e '\033[33m'
echo -e '\nWebsite description:'
curl -s http://example.com | tr -d '\n' | sed -Ern 's/  */ /gp' | sed -Ern 's/<p>(.*)<\/p>/\1/gp'

echo -e '\033[34m'
echo -e '\nWebsite description from file:'
cat example | sed -Ern 's/^.*<p>(.*)<\/p> <p>.*<\/p>.*$/\1/p'
#cat example | sed 's/h1/*****/g'

