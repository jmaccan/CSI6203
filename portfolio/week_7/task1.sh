#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA

# Module 6 Task 3 - Guessing game


# print error function
printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}

# get number function
getNumber()
{
    read -p "$1: "
    # prompt loop until num in range is entered
    while (( $REPLY < $2 || $REPLY > $3 )); do
        printError "Your guess must be between $2 and $3"
        read -p "Try again..."
    done
    # prompt loop until correct num is entered
    while (( $REPLY > $2 || $REPLY < $3 )); do
        if (( $REPLY < 42 )); then
            printError "Too low"
            read -e -p "Try again: "
        elif (( $REPLY > 42 )); then
            printError "Too High"
            read -e -p "Try again: "
        else
            echo "Correct!"
            break
        fi
    done
}

echo "Welcome to the guessing game"

# call the get num function
getNumber "Guess the magic number! Its between 1 and 100!" 1 100

echo "Goodbye"


