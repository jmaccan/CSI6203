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
    echo -e '\nConnecting to nasa.gov...\n'
    ping -c 1 apod.nasa.gov > /dev/null 2>&1

    if [ $? != 0 ];then
        echo 'NASA Connection Err (code:8)'
        exit 2
    else
        echo 'Nasa conn is good' > /dev/null 2>&1
    fi
}

# Checks to ensure date parameter is formatted correctly
checkDateValid()
{
    if [[ $1 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] && date -d "$1" > /dev/null 2>&1; then
        echo 'date valid' > /dev/null 2>&1
    else   
        echo 'Date invalid (code:6)'
        exit 3
    fi
}

## dowloadImage Function
downloadImage()
{

    # Test Nasa website connection
    testNasa

    # Download image from today (when no date is specified)
    if [ $1 = 'noDate' ];then
        title=$(getTitle https://apod.nasa.gov/apod/astropix.html)
        urlPost="$(curl -s https://apod.nasa.gov/apod/astropix.html | sed -Ern 's/<a href="image(.*)">$/\1/p')"
        echo -e "Downloading todays image ($title)...\n"
        wget -q "https://apod.nasa.gov/apod/image$urlPost"
        if [ $? = 0 ];then
            echo -e "Download complete\n"
        else   
            echo "Image download error (code:7)"
            exit 4
        fi
    else
        #download image from specified date
        checkDateValid "$date"
        url1="https://apod.nasa.gov/apod/ap"
        url2="$(echo "$date" | sed -Ern 's/[0-9]{2}([0-9]{2})-([0-9]{2})-([0-9]{2})/\1\2\3/p')"
        local title=$(getTitle $url1$url2.html)
        urlPost="$(curl -s $url1$url2.html | sed -Ern 's/^<a href="image(.*)">?/\1/p')"
        echo -e "Downloading image from $date ($title)...\n"
        wget -q "https://apod.nasa.gov/apod/image$urlPost"
        if [ $? = 0 ];then
            echo -e "Download complete\n"
        else   
            echo "Image download error (code:7)"
            exit 4
        fi
    fi
}

# showExplanation Function
showExplan()
{
    # Test Nasa website connection
    testNasa

    # get explanation from today
    if [ $1 = 'noDate' ];then
        title=$(getTitle https://apod.nasa.gov/apod/astropix.html)
        explan="$(curl -s https://apod.nasa.gov/apod/astropix.html | tr -d '\n' | sed 's/<\/*[^>]*>//g' | sed -En 's/.*Explanation: *(.*)(Tomorrow|News)(.*)/\1/p')"
        echo -e "$explan\n\nFinished.\n"
    else
        #get explanation from specified date
        checkDateValid "$date"
        url1="https://apod.nasa.gov/apod/ap"
        url2="$(echo "$date" | sed -Ern 's/[0-9]{2}([0-9]{2})-([0-9]{2})-([0-9]{2})/\1\2\3/p')"
        local title=$(getTitle $url1$url2.html) 
        explan="$(curl -s $url1$url2.html | tr -d '\n' | sed 's/<\/*[^>]*>//g' | sed -En 's/.*Explanation: *(.*)(Tomorrow|News)(.*)/\1/p')" 
        echo -e "$explan\n\nFinished.\n"
    fi
}


# showDetails Function
showDetails()
{
    # Test Nasa website connection
    testNasa
    
    #get details from today
    if [ $1 = 'noDate' ];then
        title=$(getTitle https://apod.nasa.gov/apod/astropix.html)
        echo -e "TITLE: $title\n"
        explan="$(curl -s https://apod.nasa.gov/apod/astropix.html | tr -d '\n' | sed 's/<\/*[^>]*>//g' | sed -En 's/.*Explanation: *(.*)(Tomorrow|News)(.*)/\1/p')"
        echo -e "EXPLANATION:\n\n$explan\n"
        credit="$(curl -s https://apod.nasa.gov/apod/astropix.html | tr -d '\n' | sed 's/<\/*[^>]*>//g' | sed -En 's/.*Credit(.*)Explanation.*/\1/p')"
        echo -e "IMAGE CREDIT: $credit\n\nFinished.\n"
    else
        #get details from specified date
        checkDateValid "$date"
        url1="https://apod.nasa.gov/apod/ap"
        url2="$(echo "$date" | sed -Ern 's/[0-9]{2}([0-9]{2})-([0-9]{2})-([0-9]{2})/\1\2\3/p')"
        local title=$(getTitle $url1$url2.html)
        echo -e "TITLE: $title\n"
        explan="$(curl -s $url1$url2.html | tr -d '\n' | sed 's/<\/*[^>]*>//g' | sed -En 's/.*Explanation: *(.*)(Tomorrow|News)(.*)/\1/p')"
        echo -e "EXPLANATION:\n\n$explan\n\n"
        credit="$(curl -s $url1$url2.html | tr -d '\n' | sed 's/<\/*[^>]*>//g' | sed -En 's/.*Credit(.*)Explanation.*/\1/p')"
        echo -e "IMAGE CREDIT: $credit\n\nFinished.\n"
    fi
}

# Get title function
getTitle()
{
    title=$(curl -s $1 | sed -Ern 's/^<b> (.*) <\/b> <br>?/\1/p')
    echo $title
}

## Show script help/manual (-h)
showHelp()
{
echo -e "\n------------------------------------- NASA.SH  HELP -----------------------------------------------------\n"
echo -e "       -h          show script help/manual"
echo -e "       -d          'date', if no -d then do current day. Format 'yyyy-mm-dd'"
echo -e "                   (if -d option is used, date parameter must be supplied. there is no default)"
echo -e "       -t          'explain' or 'details', if no -t then download image"
echo -e "                   (if -t option is used, type parameter must be supplied. there is no default)"
echo -e "       -           if no options set, then download todays image only"
echo -e "\n---------------------------------------------------------------------------------------------------------\n"
}


#####################  END FUNCTION LIBRARY  ####################



####################### PROCESS ARGUMENTS #######################

#set date and type
date="noDate"
type="noType"

# If no args supplied then just download todays image
if [ $# -eq 0 ];then
    # Test Nasa website connection
    downloadImage "$date"
    exit 0
# If -h option used, then run showHelp function
elif [ $1 = '-h' ];then
    showHelp
    exit 0
# if 1, 3 or gt 4 args supplied then flag as invalid. (-t and -d options require parameters)
elif [ $# -eq 1 ] || [ $# -eq 3 ] || [ $# -gt 4 ];then
    echo "invalid arguments (code:1)"
    exit 1
fi

# The following will only run if the arg count is 2 or 4
# and will check args are valid, what options and parameters have been supplied
argPos=1
for arg in "$@"; do
    case $arg in
    "-t") # type option has been parsed into the nasa script
        if [ $argPos -eq 1 ];then
            type="$2"
        elif [ $argPos -eq 3 ];then
            type="$4"
        else
            echo "invalid args (code:2)"
            exit 1
        fi
        ;;
    "-d") # date option has been parsed into the nasa script
        if [ $argPos -eq 1 ];then
            date="$2"
        elif [ $argPos -eq 3 ];then
            date="$4"
        else
            echo "invalid args (code:3)"
            exit 1
        fi
        ;;
    esac
(( argPos++ ))
done

######################### END PROCESS ARGUMENTS #######################

# Run functions depending on option and parameters

if [ $type = "noType" ];then
    downloadImage "$date"
elif [ $type = "explain" ];then
    showExplan "$date"
elif [ $type = "details" ];then
    showDetails "$date"
else
    echo "invalid args (code:5)"
    exit 1
fi

############################## PROGRAM END ##############################
exit 0



