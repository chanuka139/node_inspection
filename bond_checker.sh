cat /proc/net/bonding/bond0 >> /tmp/bondstatus
echo "------------------------------------" >> /tmp/bondstatus
cat /proc/net/bonding/bond1 >> /tmp/bondstatus
echo "------------------------------------" >> /tmp/bondstatus
cat /proc/net/bonding/bond2 >> /tmp/bondstatus
echo "------------------------------------" >> /tmp/bondstatus
cat /proc/net/bonding/bond3 >> /tmp/bondstatus
echo "------------------------------------" >> /tmp/bondstatus
cat /sys/class/net/bond0/bonding/mode >> /tmp/bondstatus
echo "------------------------------------" >> /tmp/bondstatus
cat /sys/class/net/bond1/bonding/mode >> /tmp/bondstatus
echo "------------------------------------" >> /tmp/bondstatus
ip addr >> /tmp/bondstatus
echo "------------------------------------" >> /tmp/bondstatus
route -n >> /tmp/bondstatus
echo "------------------------------------" >> /tmp/bondstatus
lshw -businfo -c network >> /tmp/bondstatus
echo "Bond checking completed"
echo "copy /tmp/bondstatus to your pendrive"
