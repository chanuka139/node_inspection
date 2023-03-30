#!/bin/bash

echo "Starting network services."

systemctl start network
sleep 5;

if [ $? == 0 ]
then 
	echo "Netowrk service started"
else
	echo "Starting network failed"
fi

echo "Checking IP addresses"
ip addr | grep '172\|192'

exit 0;
