#!/bin/sh

sudo ip link add virbr0 type bridge
sudo ip tuntap add dev tap0 mode tap user $(whoami)
sudo ip link set tap0 master virbr0
sudo ip addr add 192.168.7.100/24 dev virbr0
sudo ip link set dev virbr0 up
sudo ip link set dev tap0 up
