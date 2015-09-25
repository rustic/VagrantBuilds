#!/bin/bash

if [[ `sudo facter virtual` != "vmware" ]]; then
    exit 0
fi

# Install the VMWare Tools from a linux ISO.

sudo dnf install -y fuse-libs open-vm-tools
