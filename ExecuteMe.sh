#!/bin/bash

echo "Stopping network manager"
systemctl stop NetworkManager

echo "Prepare the environment"

sh prepare_environment.sh

echo "Initial node inspection"

sh node_inspection.sh

echo "Creating network and bonding"

sh bond_create.sh


echo "Starting the network"
sh network_startup.sh

echo "Check bonding status and failover"
sh bond_failover.sh >> /tmp/bondfailover

echo "Check Bonding status"

sh bond_checker.sh

echo "Copying out the ipmi testing script to /tmp"
cp check_ipmi.sh /tmp/

echo "Copy the files related to the testing.And unmount the pendrive."

exit 0;
