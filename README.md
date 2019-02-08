# RPi-Ethernet

This script gives you an SSH connection to your Raspberry Pi by grabbing the ip address of a Pi connected to your machine via ethernet cable.

# Setup
To use, you must configure for the wired network "Shared to other computers" under "Method" in the IPv4 tab of the NetworkManager GUI.

For those running Ubuntu 18.04LTS, you must run

`nm-connection-editor`

After that, click on the ethernet device and click on the gear on the bottom left corner.  There you will find the IPv4 tab.

# Dependencies
This script utilizes the following:

- nmap
- ip

`ip` is used in place of `ifconfig` because newer installs tend not(?) to have `ifconfig` anymore.  If you prefer to use `ifconfig`, run

`sed -i 's/ip addr/ifconfig/g' pissh.sh`
