#!/bin/bash

# Author: J Maccan
# Date: September 2019
# Version: NA

# Module 7 Task 2 - Manipulating

net_info="$(ifconfig)"

#parse out the ip address lines using sed
addresses=$(echo "$net_info" | sed -n '/inet / {
s/inet/IP Address:/
s/netmask/\n\t\tSubnet Mask:/
s/broadcast/\n\t\tBroadcast Address:/
p
}')
#format output
echo -e "IP addresses on this computer are:\n$addresses"




