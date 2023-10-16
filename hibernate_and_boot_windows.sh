#!/bin/bash

# Run efibootmgr to set the next boot entry to 0001
sudo efibootmgr -n 0001

# Check the exit status of efibootmgr
if [ $? -eq 0 ]; then
    echo "efibootmgr command executed successfully."
    # Hibernate the system
    sudo systemctl hibernate
    if [ $? -eq 0 ]; then
        echo "System hibernated successfully."
    else
        echo "Error: Failed to hibernate the system."
    fi
else
    echo "Error: Failed to set the boot entry using efibootmgr."
fi

