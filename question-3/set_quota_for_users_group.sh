#!/bin/bash
### Please install this members using the following if you never use members before. 
#sudo apt-get update 
#sudo apt-get install members


# Path to the pool.d directory (adjust as needed)
GROUP_NAME="users"
group_members=$(members "$GROUP_NAME")

# Loop through all .conf files in the pool.d directory
for user in $group_members; do
    # Add usrquota and grpquota options in front of existing options
    if [ "$user" != 'lxd' ]; then 
        sudo setquota -u $user 10000M 11200M 0 0 /
    fi
done
sudo repquota -s /
echo "Done Modify the quota of each user in $GROUP_NAME"
