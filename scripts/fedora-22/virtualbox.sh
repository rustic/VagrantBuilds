#!/bin/bash

set -e
set -x

if [[ `sudo facter virtual` = "vmware" ]]; then
    exit 0
fi

sudo dnf -y install dkms
# Uncomment this if you want to install Guest Additions with support for X
#sudo dnf -y install xorg-x11-server-Xorg

sudo systemctl start dkms
sudo systemctl enable dkms

next_loop=$(($(ls -1 /dev/loop* | sed 's/[^0-9]//g' | LC_ALL=C sort -n | tail -1)+1)) ; mknod -m660 /dev/loop${next_loop} b 7 ${next_loop} ; chown root.disk /dev/loop${next_loop} ; unset next_loop ;

sudo mount -o loop,ro /home/vagrant/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
sudo rm -f /home/vagrant/VBoxGuestAdditions.iso
