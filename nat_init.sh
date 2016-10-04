#!/bin/sh

switch=br0
prefix=192.168.2
gateway=${prefix}.1
net=${prefix}.0
len=24

if ! brctl show | grep -q ^$switch
then
	brctl addbr $switch
	ip addr add dev $switch $gateway/24
	ip link set $switch up
	iptables -t nat -A POSTROUTING -s $net/$len \! -d $net/$len  -j MASQUERADE
fi
