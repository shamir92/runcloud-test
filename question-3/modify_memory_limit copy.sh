#!/bin/bash

# Path to the pool.d directory (adjust as needed)
POOL_DIR="/etc/php/8.1/fpm/pool.d"

# Loop through all .conf files in the pool.d directory
for conf_file in "$POOL_DIR"/*.conf; do
    # Add usrquota and grpquota options in front of existing options
    sudo sed -i 's/;php_admin_value\[memory_limit\] = .*/php_admin_value[memory_limit] = 128M/' "$conf_file"
done

echo "Modified all .conf files in $POOL_DIR"
