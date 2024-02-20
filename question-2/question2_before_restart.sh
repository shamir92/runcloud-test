#!/bin/bash

# Install quota tools
sudo apt update
sudo apt install quota

# Check kernel modules
sudo apt install linux-image-extra-virtual

# Restart unit after installing new kernel
sudo shutdown -r now 
