#!/bin/bash

host_name=$1

if [ $host_name == "" ]
then
	echo "Please enter iDRAC IP as a cmd parameter."
	exit 1; 
fi

ln -s /run/media/liveuser/CENTOS\ 7\ X8/ /mnt/centos7
yum --disablerepo=* --enablerepo=centos7 install OpenIPMI ipmitool -y
ipmitool -I lanplus -H $host_name -U root -P12\#\$qwERasdf chassis power status

exit 0;
