# RPi-Ethernet

This script gives you an SSH connection to your Raspberry Pi by grabbing the ip address of a Pi connected to your machine via ethernet cable.

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

Create an empty file called `ssh` in that boot partition, unmount, place the microSD back into the pi, and boot the pi.  Note that the file must not have an extension (Windows calls the type "File").

# Setup (Linux)
To use, you must configure for the wired network "Shared to other computers" under "Method" in the IPv4 tab of the NetworkManager GUI.

For those who cannot find the wired network option in their network settings, try

`nm-connection-editor`

After that, click on the ethernet device and click on the gear on the bottom left corner.  There you will find the IPv4 tab.

# Dependencies
This script utilizes the following:

- nmap
- ip

`ip` is used in place of `ifconfig` because newer installs tend not(?) to have `ifconfig` anymore.  If you prefer to use `ifconfig`, run

`sed -i 's/ip addr/ifconfig/g' pissh.sh`
