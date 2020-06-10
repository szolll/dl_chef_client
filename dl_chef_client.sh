#!/bin/bash
# Small script that installs Chef client on centos8 
# Script should work for other distros, but do change the DLLINK and PGNAME to fit your system
# 
# Official download location for Chef
# https://downloads.chef.io/chef

# Provide the download location, needs a trailing /
DLLINK=https://packages.chef.io/files/stable/chef/16.1.16/el/8/
# Provide the name and version
PGNAME=chef-16.1.16-1.el7.x86_64.rpm

# Check if wget is installed and if not,install it now
if ! [ -x "$(command -v wget)" ]; then
  echo 'Error: wget not found on this system. Installing it now.' >&2
  # install wget
  yum install wget
fi

printf 'Downloading Chef now. the rpm can be found here :'`pwd`
wget $DLLINK$PGNAME

echo 'Installing '$PGNAME

yum install $PGNAME -y

echo '\n Now run chef-client for the first time, please follow the onscreen instructions'.
