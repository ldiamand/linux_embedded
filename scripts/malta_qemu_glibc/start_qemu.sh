#!/bin/sh

# No va otra variable definida en el script principal                           
export DATA=${PROJECT_ROOT}/bootloader/data                                         
export UBOOT_IMAGE=${DATA}/u-boot.bin

qemu-system-mips -M ${QEMU_MACHINE} -m 256M -nographic \
  -device loader,file=${PROJECT_ROOT}/kernel/data/uImage,addr=0x8001000 \
  -dtb ${PROJECT_ROOT}/kernel/data/malta.dtb \
  -net nic -net tap,ifname=tap0,script=no,downscript=no 
#  -drive file=${UBOOT_IMAGE},if=pflash,format=raw \
#  -drive file=images/rootfs.sqfs,if=sd,format=raw 
#  -append "console=ttyAMA0 root=/dev/mmcblk0 rootfstype=squashfs" \
#  -serial pty 
#-s -S
#  -drive file=${DATA}/sd.img,if=sd,format=raw #\

