#!/bin/bash

colour_green()
{
    echo -e -n "Green Text: \033[32m"

}

colour_reset()
{
    echo -n -e "\033[0m"

}

echo "this is some normal text"
colour_green
echo "this is some green text"
colour_reset
echo "back to normal"
