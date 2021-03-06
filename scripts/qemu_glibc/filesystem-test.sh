#!/bin/sh

# No va otra variable definida en el script principal
export DATA=${PROJECT_ROOT}/kernel/data
export KERNEL_IMAGE=${DATA}/zImage
export DTB_IMAGE=${DATA}/vexpress-v2p-ca9.dtb
export ROOT_FILE_SYSTEM=${PROJECT_ROOT}/images/rootfs.sqfs

mksquashfs rootfs/ images/rootfs.sqfs -noappend
truncate -s %256k images/rootfs.sqfs

QEMU_AUDIO_DRV=none qemu-system-arm -M ${QEMU_MACHINE} -m 128M -nographic \
  -kernel ${KERNEL_IMAGE} -dtb ${DTB_IMAGE} \
  -drive file=images/rootfs.sqfs,if=sd,format=raw \
  -append "console=ttyAMA0 root=/dev/mmcblk0 rootfstype=squashfs" \
  -serial pty

#qemu-system-x86_64 -kernel bzImage -initrd initrd.img-3.11 -append "root=/dev/ram rdinit=/sbin/init"
