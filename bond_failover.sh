#!/bin/bash

echo "Checking bond0 status"
cat /proc/net/bonding/bond0 | grep Interface
cat /proc/net/bonding/bond0 | grep Status

echo "Checking bond1 status"
cat /proc/net/bonding/bond1 | grep Interface
cat /proc/net/bonding/bond1 | grep Status

echo "Checking bond2 status"
cat /proc/net/bonding/bond2 | grep Interface
cat /proc/net/bonding/bond2 | grep Status

echo "Checking bond3 status"
cat /proc/net/bonding/bond3 | grep Interface
cat /proc/net/bonding/bond3 | grep Status

echo ""

echo "Check reachability"

check1=$(ping -c 3 172.27.252.67)


if [ $? == 0 ]
then
  echo "Bond0 VLAN 1006 is accessible."
else
  echo "Bond0 VLAN 1006 is not accessible."
fi


check2=$(ping -c 3 172.27.254.63)


if [ $? == 0 ]
then
  echo "Bond0 VLAN 1007 is accessible."
else
  echo "Bond0 VLAN 1007 is not accessible."
fi


check3=$(ping -c 3 192.168.100.63)


if [ $? == 0 ]
then
  echo "Bond1 VLAN 926 is accessible."
else
  echo "Bond1 VLAN 926 is not accessible."
fi


check4=$(ping -c 3 172.27.32.63)


if [ $? == 0 ]
then
  echo "Bond2 VLAN 1011 is accessible."
else
  echo "Bond2 VLAN 1011 is not accessible."
fi


check5=$(ping -c 3 172.27.253.88)


if [ $? == 0 ]
then
  echo "Bond3 VLAN 1008 is accessible."
else
  echo "Bond3 VLAN 1008 is not accessible."
fi



echo "Starting to check interface failover."
ifdown em1
ifdown p2p2
ifdown p1p1
ifdown p7p2

echo "Waiting for interfaces to go down."
sleep 5;

echo "Once interface is down from each bond"

check1=$(ping -c 3 172.27.252.67)


if [ $? == 0 ]
then
  echo "Bond0 VLAN 1006 is accessible."
else
  echo "Bond0 VLAN 1006 is not accessible."
fi


check2=$(ping -c 3 172.27.254.63)


if [ $? == 0 ]
then
  echo "Bond0 VLAN 1007 is accessible."
else
  echo "Bond0 VLAN 1007 is not accessible."
fi


check3=$(ping -c 3 192.168.100.63)


if [ $? == 0 ]
then
  echo "Bond1 VLAN 926 is accessible."
else
  echo "Bond1 VLAN 926 is not accessible."
fi


check4=$(ping -c 3 172.27.32.63)


if [ $? == 0 ]
then
  echo "Bond2 VLAN 1011 is accessible."
else
  echo "Bond2 VLAN 1011 is not accessible."
fi


check5=$(ping -c 3 172.27.253.88)


if [ $? == 0 ]
then
  echo "Bond3 VLAN 1008 is accessible."
else
  echo "Bond3 VLAN 1008 is not accessible."
fi

echo "Starting the stopped interfaces."
ifup em1
ifup p2p2
ifup p1p1
ifup p7p2
echo "Waiting for the interfaces to come up"
sleep 5;

echo "Stopping the other interface from each bond"
ifdown p6p1
ifdown p7p1
ifdown p2p1
ifdown p1p2
echo "Waiting for the interfaces go down and bond to form"
sleep 5;

echo "The other interface is down now. The previously down interface is now up."

check1=$(ping -c 3 172.27.252.67)


if [ $? == 0 ]
then
  echo "Bond0 VLAN 1006 is accessible."
else
  echo "Bond0 VLAN 1006 is not accessible."
fi


check2=$(ping -c 3 172.27.254.63)


if [ $? == 0 ]
then
  echo "Bond0 VLAN 1007 is accessible."
else
  echo "Bond0 VLAN 1007 is not accessible."
fi


check3=$(ping -c 3 192.168.100.63)


if [ $? == 0 ]
then
  echo "Bond1 VLAN 926 is accessible."
else
  echo "Bond1 VLAN 926 is not accessible."
fi


check4=$(ping -c 3 172.27.32.63)


if [ $? == 0 ]
then
  echo "Bond2 VLAN 1011 is accessible."
else
  echo "Bond2 VLAN 1011 is not accessible."
fi


check5=$(ping -c 3 172.27.253.88)


if [ $? == 0 ]
then
  echo "Bond3 VLAN 1008 is accessible."
else
  echo "Bond3 VLAN 1008 is not accessible."
fi

echo "Starting all interfaces up now"
ifup p6p1
ifup p7p1
ifup p2p1
ifup p1p2
echo "Waiting for the interfaces to come up"
sleep 5;

echo "All interfaces are up now."
echo "Starting to check jumbo freams"

ping -c 3 -M do -s 8972 172.27.252.67
ping -c 3 -M do -s 8972 172.27.254.63
ping -c 3 -M do -s 8972 192.168.100.63
ping -c 3 -M do -s 8972 172.27.32.63
ping -c 3 -M do -s 8972 172.27.253.88

exit 0;
