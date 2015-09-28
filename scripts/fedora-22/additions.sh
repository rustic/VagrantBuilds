#!/bin/bash

set -e
set -x

sudo dnf -y install bzip2
sudo dnf -y install gcc
sudo dnf -y install kernel-headers
sudo dnf -y install kernel-devel
sudo dnf -y install make
sudo dnf -y install perl
sudo dnf -y install ruby
sudo dnf -y install facter
