#!/bin/bash

if [[ `sudo facter virtual` != "vmware" ]]; then
    exit 0
fi

# Install the VMWare Tools from a linux ISO.

sudo mount -o loop,ro ~/linux.iso /mnt/

cd /tmp
sudo tar xzf /mnt/VMwareTools-*.tar.gz

sudo umount /mnt/
sudo rm -fr ~/linux.iso

sudo /tmp/vmware-tools-distrib/vmware-install.pl -d
sudo rm -fr /tmp/vmware-tools-distrib
