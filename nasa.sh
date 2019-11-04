#!/bin/bash

# Author: J Maccan
# Date: November 2019
# Version: NA
# Description: CSI6203 Assignment - Software based solution - NASA Data retrieval

##############################  README  ############################

#  Script Options:

#       -h          show script help/manual
#       -d          'date', if no -d then do current day. Format 'yyyy-mm-dd'
#                   (if -d option is used, date parameter must be supplied. there is no default)
#       -t          'explain' or 'details', if no -t then download image
#                   (if -t option is used, type parameter must be supplied. there is no default) 
#       -           if no options set, then download todays image only

##########################  END README  ############################



########################  FUNCTION LIBRARY  ########################


## testNasaConn Function 
testNasa()
{
    ping -c 1 apod.nasa.gov > /dev/null 2>&1

    if [ $? != 0 ];then
        echo 'NASA Connection Err'
        exit 2
    else
        echo 'conn good'
    fi
}

checkDateValid()
{
    #echo 'inside checkDateValid function. arg: $1'
    if [[ $1 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] && date -d "$1" > /dev/null 2>&1; then
        echo 'date valid' > /dev/null 2>&1
    else   
        echo 'date invalid'
        exit 3
    fi
}

## dowloadImage Function
downloadImage()
{
    #echo "download image function. arg: $1"
    if [ $1 = 'noDate' ];then
        echo "download image for TODAY"
    else
        #dateValStat=$(checkDateValid $date)
        checkDateValid "$date"
        #echo "$dateValStat"
        echo "download image for date: $1"
    fi
}

## showExplain Function
showExplain()
{
    #echo "show explain function. arg: $1"
    
    if [ $1 = 'noDate' ];then
        echo "show explaination for TODAY"
    else
        #dateValStat=$(checkDateValid $date)
        checkDateValid "$date"
        #echo "$dateValStat"
        echo "show explaination for date: $1"
    fi

}


## showDetails Function
showDetails()
{
    #echo "show details function. arg: $1"

    if [ $1 = 'noDate' ];then
        echo "show details for TODAY"
    else
        #dateValStat=$(checkDateValid $date)
        checkDateValid "$date"
        #echo "$dateValStat"
        echo "show showDetails for date: $1"
    fi

}

## Show script help/manual (-h)
showHelp()
{
    echo 'show help function'
}


#####################  END FUNCTION LIBRARY  ####################



####################### PROCESS ARGUMENTS #######################

#echo "all args: $@"

#set date and type
date="noDate"
type="noType"

# If no args supplied then just download todays image
if [ $# -eq 0 ];then
    # Test Nasa website connection
    testNasa
    downloadImage "$date"
    exit 0
# If -h option used, then run showHelp function
elif [ $1 = '-h' ];then
    showHelp
    exit 0
# if 1, 3 or gt 4 args supplied then flag as invalid. (-t and -d options require parameters)
elif [ $# -eq 1 ] || [ $# -eq 3 ] || [ $# -gt 4 ];then
    echo "invalid arguments (code: 1)"
    exit 1
fi

# The following will only run if the arg count is 2 or 4
# and will check args are valid, what options and parameters have been supplied

argPos=1
for arg in "$@"; do
#echo -e "\nfor iteration $argPos BEGIN"
    case $arg in
    "-t") # type option has been parsed into the nasa script
        #echo "type option has been selected. Pos = $argPos"
        if [ $argPos -eq 1 ];then
            type="$2"
            #echo "$type"
        elif [ $argPos -eq 3 ];then
            type="$4"
            #echo "$type"
        else
            echo "invalid args (code: 2)"
            exit 1
        fi
        ;;
    "-d") # date option has been parsed into the nasa script
        #echo "date option has been selected. Pos = $argPos"
        if [ $argPos -eq 1 ];then
            date="$2"
            #echo "$date"
        elif [ $argPos -eq 3 ];then
            date="$4"
            #echo "$date"
        else
            echo "invalid args (code: 3)"
            exit 1
        fi
        ;;
    #*) # no valid option has been selected   
            #echo "invalid args (code: 4)"
            #exit 1
    esac
    
#echo -e "for iteration $argPos END\n"
(( argPos++ ))

done

######################### END PROCESS ARGUMENTS #######################

# Test Nasa website connection
testNasa

# Run functions depending on options



if [ $type = "noType" ];then
    downloadImage "$date"
elif [ $type = "explain" ];then
    showExplain "$date"
elif [ $type = "details" ];then
    showDetails "$date"
else
    echo "invalid args (code: 5)"
    exit 1
fi




############################## PROGRAM END ##############################
#echo 'Goodbye!'
exit 0



