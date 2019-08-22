#!/bin/sh

# No va otra variable definida en el script principal
export DATA=${PROJECT_ROOT}/kernel/data
export KERNEL_IMAGE=${DATA}/zImage
export DTB_IMAGE=${DATA}/vexpress-v2p-ca9.dtb

QEMU_AUDIO_DRV=none qemu-system-arm -M ${QEMU_MACHINE} -m 128M \
  -kernel ${KERNEL_IMAGE} -dtb ${DTB_IMAGE} -nographic
#  -append "console=ttyAMA0 console=tty0" -serial pty

#QEMU_AUDIO_DRV=none qemu-system-arm -M vexpress-a15 -m 128M \
#  -kernel ${KERNEL_IMAGE} -dtb ${DTB_IMAGE} \
#  -append "console=tty0"
#  -append "console=ttyAMA0 root=/dev/mmcblk0 rootfstype=squashfs" \
#  -net nic -net tap,ifname=tap0,script=no,downscript=no \
#  -drive file=images/rootfs.sqfs,if=sd,format=raw \
#  -serial pty -s -S

