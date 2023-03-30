#!/bin/bash

mkdir -p /hms
cp -rp /etc/sysconfig/network-scripts/ /hms/
cp -rp /run/media/liveuser/CHANUKA/utils /hms/
cp -p /run/media/liveuser/CHANUKA/utils/centos7.repo /etc/yum.repos.d/
cd /hms/

exit 0;
