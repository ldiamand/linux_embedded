#!/bin/sh

# No va otra variable definida en el script principal                           
export DATA=${PROJECT_ROOT}/bootloader/data                                         
export UBOOT_IMAGE=${DATA}/u-boot

QEMU_AUDIO_DRV=none qemu-system-arm -M ${QEMU_MACHINE} -m 128M -nographic \
  -kernel ${UBOOT_IMAGE} \
  -net nic -net tap,ifname=tap0,script=no,downscript=no \
  -drive file=${DATA}/pflash0.img,if=pflash,format=raw \
  -drive file=${DATA}/pflash1.img,if=pflash,format=raw \
  -drive file=images/rootfs.sqfs,if=sd,format=raw \
  -append "console=ttyAMA0 root=/dev/mmcblk0 rootfstype=squashfs" \
  -serial pty 
#-s -S
#  -drive file=${DATA}/sd.img,if=sd,format=raw #\
