#!/bin/sh

if [ -z $2 ]
then
  echo "Usage: $0 <IP> <port>"
  exit
fi

ip=$1
port=$2

echo -n "Setting portforward from port $port to $ip:$port..."
iptables -t nat -A PREROUTING -p tcp --dport $port -j DNAT --to-destination $ip:$port
echo 'OK'
