#!/bin/bash

set -e
set -x

if [[ `sudo facter virtual` = "vmware" ]]; then
    exit 0
fi

sudo dnf -y install dkms
sudo dnf -y install gcc 
sudo dnf -y install kernel-headers  
sudo dnf -y install make
sudo dnf -y install perl
# Uncomment this if you want to install Guest Additions with support for X
#sudo dnf -y install xorg-x11-server-Xorg

sudo systemctl start dkms
sudo systemctl enable dkms

sudo mount -o loop,ro /home/vagrant/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
sudo rm -f /home/vagrant/VBoxGuestAdditions.iso
