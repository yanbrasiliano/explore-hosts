#/usr/bin/env bash
#
# nmap.sh - Automates data collection from hosts with nmap.
#
# Site: 							hellolibre.blogspot.com
# Author: 						Yan Brasiliano Silva Penalva <yanpenabr@gmail.com>
# Maintenance: 				Yan Brasiliano Silva Penalva <yanpenabr@gmail.com>
#
#----------------------------------------------------------------------
# This script has the function of automating the data collection of the desired host. 
# 
#
# Exemplo:
# $./nmap.sh -h
# In this example, the result of the whois command will be returned. 
#
#----------------------------------------------------------------------
# Historic: 
#
# 	v1.0 2021.01.09, Yan Brasiliano:
# 		- Initial version of the program. 
# 
#	
#		v1.1 2021.01.21, Yan Brasiliano:
# 		- Adding verbose function and OS discovery function.  
#
# ----------------------------------------------------------------------
# Tested:
# 			BASH 5.0.3
# 			ZSH 5.7.1
# ----------------------------------------------------------------------
# License: GNU General Public License 
# ----------------------------------------------------------------------	
# Required packages:
#			To use this script, NMAP and WHOIS must be installed on the machine. 
# ----------------------------------------------------------------------

echo -n "Enter the address of the target host:  " && read target

EXIT_KEY=0
help=$"

-h show the target's DNS data.

-i to find out the target's IP address.

-e to discover the open ports available on the target host. 

-I to find out more about the target.

-a to discovery OS.

-x Exit.
  
	"
echo "$help"
echo -n "Parameter: " && read input

case $input in

-h) echo "$(whois $target)" 											         ;;
-i) echo "$(host $target)" 											           ;;
-e) echo "$(sudo nmap -sS -v $target)" 							 			 ;;
-I) echo "$(sudo nmap -A -v $target)" 								 		 ;;
-a) echo "$(sudo nmap -sV -A $target)"										 ;;
-x) EXIT_KEY=1 													                   ;;
*) echo "ERROR: typed valid parameter!" && exit 1          ;;

esac
	

if [ "$EXIT_KEY" -eq 1 ]; then

	break

fi
