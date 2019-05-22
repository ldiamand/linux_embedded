# linux_embedded

sudo dd if=output/images/sdcard.img of=/dev/mmcblk0 bs=1M conv=fdatasync
status=progress

https://brezular.com/2011/06/19/bridging-qemu-image-to-the-real-network-using-tap-interface/
https://blog.elastocloud.org/2015/07/qemukvm-bridged-network-with-tap.html

sudo ip addr add 192.168.50.5 dev eth1
sudo ip addr show
sudo ip addr del 192.168.50.5/24 dev eth1
sudo ip link set eth1 up
sudo ip link set eth1 down
sudo ip route show
sudo ip route add 10.10.20.0/24 via 192.168.50.100 dev eth0
sudo ip route del 10.10.20.0/24
sudo ip route add default via 192.168.50.100
sudo ip addr flush dev eth0

sudo vi /etc/network/interfaces
sudo /etc/init.d/network restart

