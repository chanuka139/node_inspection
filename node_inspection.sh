#!/bin/bash

OUT_FILE=/tmp/info.txt

echo "Checking CPU INFO" >> $OUT_FILE
cat /proc/cpuinfo >> $OUT_FILE
echo "Checking RAM" >> $OUT_FILE
free -m >> $OUT_FILE
echo "Checking all disks" >> $OUT_FILE
fdisk -l >> $OUT_FILE
echo "Checking interfaces" >> $OUT_FILE
lspci | grep Ethernet >> $OUT_FILE
echo "Checking IP information" >> $OUT_FILE
ip addr >> $OUT_FILE

echo "Check for the " $OUT_FILE "File"

exit 0;
