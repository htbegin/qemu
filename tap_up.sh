#!/bin/sh

switch=br0

ip link set $1 up
brctl addif $switch $1
exit 0
