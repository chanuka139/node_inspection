#!/bin/bash

systemctl stop NetworkManager

echo 'options ixgbe allow_unsupported_sfp=1' >> /etc/modprobe.d/ixgbe.conf
rmmod ixgbe
modprobe ixgbe

echo "alias bond0 bonding" > /etc/modprobe.d/bonding.conf
echo "alias bond1 bonding" >> /etc/modprobe.d/bonding.conf
echo "alias bond2 bonding" >> /etc/modprobe.d/bonding.conf
echo "alias bond3 bonding" >> /etc/modprobe.d/bonding.conf


cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-bond0
DEVICE=bond0
ONBOOT=yes
NM_CONTROLLED=no
BONDING_OPTS="miimon=100 mode=1"
BOOTPROTO=static
IPADDR=172.27.252.250
NETMASK=255.255.254.0
GATEWAY=172.27.252.1
MTU=9000
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-bond1
DEVICE=bond1
ONBOOT=yes
BONDING_OPTS='miimon=100 mode=4 lacp_rate=1 xmit_hash_policy=1'
NM_CONTROLLED=no
MTU=9000
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-bond2
DEVICE=bond2
ONBOOT=yes
BONDING_OPTS='miimon=100 mode=4 lacp_rate=1 xmit_hash_policy=1'
NM_CONTROLLED=no
MTU=9000
EOF


cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-bond3
DEVICE=bond3
ONBOOT=yes
BONDING_OPTS='miimon=100 mode=4 lacp_rate=1 xmit_hash_policy=1'
NM_CONTROLLED=no
MTU=9000
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-em1
DEVICE=em1
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
BOOTPROTO=none
MTU=9000
MASTER=bond0
SLAVE=yes
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-p6p1
DEVICE=p6p1
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
BOOTPROTO=none
MTU=9000
MASTER=bond0
SLAVE=yes
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-p2p2
DEVICE=p2p2
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
MASTER=bond1
SLAVE=yes
BOOTPROTO=none
MTU=9000
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-p7p1
DEVICE=p7p1
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
MASTER=bond1
SLAVE=yes
BOOTPROTO=none
MTU=9000
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-p1p1
DEVICE=p1p1
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
MASTER=bond2
SLAVE=yes
BOOTPROTO=none
MTU=9000
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-p2p1
DEVICE=p2p1
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
MASTER=bond2
SLAVE=yes
BOOTPROTO=none
MTU=9000
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-p7p2
DEVICE=p7p2
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
MASTER=bond3
SLAVE=yes
BOOTPROTO=none
MTU=9000
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-p1p2
DEVICE=p1p2
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
MASTER=bond3
SLAVE=yes
BOOTPROTO=none
MTU=9000
EOF

#==========================================================
cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-vlan926
DEVICE=vlan926
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
VLAN=yes
PHYSDEV=bond1
BOOTPROTO=static
IPADDR=192.168.100.200 
NETMASK=255.255.252.0
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-vlan1011
DEVICE=vlan1011
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
VLAN=yes
PHYSDEV=bond2
BOOTPROTO=static
IPADDR=172.27.32.199
NETMASK=255.255.224.0
EOF


cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-vlan1007
DEVICE=vlan1007
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
VLAN=yes
PHYSDEV=bond0
BOOTPROTO=static
IPADDR=172.27.254.250
NETMASK=255.255.254.0
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-vlan1008
DEVICE=vlan1008
ONBOOT=yes
HOTPLUG=no
NM_CONTROLLED=no
PEERDNS=no
VLAN=yes
PHYSDEV=bond3
BOOTPROTO=static
IPADDR=192.168.253.250
NETMASK=255.255.252.0
EOF
