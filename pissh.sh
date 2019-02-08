#!/bin/bash

if [[ "$(ip addr)" !=  *"10.42."* ]]; then
	echo "You have not set up the 'Shared to other computers' option in the Network Manager GUI."
	echo "If you have unplugged your PI, you may also receive this message."
	exit
fi

IP=$(nmap -n 10.42.0.255/24 | grep 'Nmap scan report for' | cut -f 5 -d ' '| sed -n '2 p')


if [ -z $IP ]; then
	echo "Error: The pi is not (yet) found. Please check your connection or wait and try again."
	echo "Please note that it DOES take awhile for the Pi to receive an address, so please be patient."
	exit
fi

echo "***************************************"
echo "raspberrypi ip address: $IP"
echo "***************************************"

if [ $# == 0 ]; then
	name=pi
	echo "Defaulting to autheticating as 'pi'. Add the username as an argument to override this behavior."
	echo
else
	name=$1
fi


ssh $name@$IP -Y
