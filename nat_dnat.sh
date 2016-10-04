#!/bin/sh

if test $# -ne 2 || test -z "$1" || test -z "$2"
then
	echo "Usage: $0 ip port"
	exit
fi

ip=$1
port=$2

host=192.168.199.50
iptables -t nat -A PREROUTING -p tcp -d ${host} --dport $port -j DNAT --to $ip:$port
