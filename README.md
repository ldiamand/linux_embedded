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

qemu-system-i386 -m 64 -k fr -boot c -kernel images/bzImage -drive
if=ide,file=images/rootfs.squashfs -append "root=/dev/sda"

qemu-system-i386 -m 64 -k fr -boot c -kernel images/bzImage -drive
if=mtd,file=images/rootfs.squashfs -append "root=/dev/mtdblock0"

By default grub is built for systems which have RAM at address 0x00000000.
However the Versatile Express platform which we are targeting has RAM starting
from 0x60000000 so we need to make a couple of modifications. First in
grub-core/Makefile.core.def we need to change arm_uboot_ldflags, from:

-Wl,-Ttext=0x08000000

to

-Wl,-Ttext=0x68000000

and second we need make a similar change to include/grub/offsets.h changing
GRUB_KERNEL_ARM_UBOOT_LINK_ADDR from 0x08000000 to 0x68000000.

I already read somewhere if unknown-block(x,y) appears and x = 0 then the whole
device couldn't be accessed and y = 0 when just the partition couldn't be found.
That confirms my assumption that the kernel isn't even able to find the device.
But I've enabled the SD/MMC support as you can see in the post before.


 a particular console as the default:

/usr/bin/qemu-system-arm -M versatilepb -kernel toolchain/etc/plx49/zImage-4.2.8 -initrd fs.squashfs -append 'root=/dev/ram0 init=/bin/sh'

 du -s -B 4096 rootfs

 dd if=/dev/zero of=rootfs.img bs=1 count=0 seek=300M

mkfs.ext4 -b 4096 -F rootfs.img


QEMU_AUDIO_DRV=none qemu-system-arm -M vexpress-a9 -m 128 -nographic -kernel
kernel/data/zImage -dtb kernel/data/vexpress-v2p-ca9.dtb -drive
file=images/rootfs.img,if=sd,format=raw -append 'console=ttyAMA0
root=/dev/mmcblk0 init=/bin/sh'


qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel output/images/zImage -dtb
output/images/vexpress-v2p-ca9.dtb -drive
file=output/images/rootfs.squashfs,if=sd,format=raw -append
"console=ttyAMA0,115200 root=/dev


truncate -s %256k images/rootfs.sqfs


sudo apt-get install liblz4-tool
