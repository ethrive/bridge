#!/usr/bin/env sh

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun
ip tuntap add mode tap tap

PHY_IFACE=eth0
ZT_IFACE="zt+"
iptables -t nat -A POSTROUTING -o $PHY_IFACE -j MASQUERADE
iptables -A FORWARD -i $PHY_IFACE -o $ZT_IFACE -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $ZT_IFACE -o $PHY_IFACE -j ACCEPT

sleep 1
zerotier-one &
sleep 1
zerotier-cli join 35c192ce9b366ea2

nginx -g "daemon off;"

