#!/bin/bash

# create user shamir to group users
sudo useradd shamir -mg users

# Set user quota for "sammy" (adjust values as needed)
sudo setquota -u shamir 10000M 11000M 0 0 /

# Display quota status for "sammy"
sudo quota -vs shamir

# Set grace period (10 days)
sudo setquota -t 864000 864000 /

echo "Disk quotas are now set up!"
