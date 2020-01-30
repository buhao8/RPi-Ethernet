# RPi-Ethernet

This script gives you an SSH connection to your Raspberry Pi by grabbing the ip address of a Pi connected to your machine via ethernet cable.

# Dependencies
This script utilizes the following (on the host computer):

- nmap
- ip

`ip` is used in place of `ifconfig` because newer installs tend not(?) to have `ifconfig` anymore.  If you prefer to use `ifconfig`, run

`sed -i 's/ip addr/ifconfig/g' pissh.sh`

on the script before executing.

# Setup (Raspberry Pi)
After installing Raspbian, you need to enable SSH on your Raspberry Pi.  There are two ways to do this.

### Method One
Open up a terminal and run the command:

`sudo raspi-config`

You will be presented with a window that you can navigate with keyboard arrow keys.  Select `interfacing options` and then `SSH`.

Choose `Yes`, `OK`, then `Finish`.  Reboot your Pi, then follow the Linux Setup instructions.

### Method Two
Warning: This will <i>not</i> work if you have used NOOBS to install Raspbian.

Insert the microSD card into a computer and open the boot partition.  You should see files such as `config.txt`.

Create an empty file called `ssh` in that boot partition, unmount, place the microSD back into the pi, and boot the pi.

<b>Note:</b> The file must not have an extension (Windows calls the type "File").

# Setup (Linux)
To use, you must configure for the wired network "Shared to other computers" under "Method" in the IPv4 tab of the NetworkManager GUI.

For those who cannot find the wired network option in their network settings, try

`nm-connection-editor`

After that, click on the ethernet device and click on the gear on the bottom left corner.  There you will find the IPv4 tab.

<b>Note:</b> In the case that you are using a different network manager, you should consult the appropriate documentation to achieve this functionality.

# Usage
`./pissh.sh [username]`

Where `[username]` is an optional parameter for the username of the SSH session.  Defaults to `pi`.

# Troubleshooting
- <b>I don't have permission to run this file!</b>
  - `chmod +x pissh.sh`
- <b>The file doesn't exist!</b>
  - `cd` into the directory where pissh.sh is.
- <b>You have not set up the 'Shared to other computers' option in the Network Manager GUI.</b>
  - Either you haven't set up ethernet sharing, or your computer is setting a different ip address.  Check the ip address at your ethernet port and change the values in pissh.sh to match if it is not `10.42.0.1`.
- <b>Error: The pi is not (yet) found. Please check your connection or wait and try again.</b>
  - Be patient!  It can take awhile for the pi to be found on the network.
