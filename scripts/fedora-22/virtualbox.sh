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

sudo mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
