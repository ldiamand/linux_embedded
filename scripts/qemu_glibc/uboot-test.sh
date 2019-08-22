#!/bin/sh

# No va otra variable definida en el script principal                           
export DATA=${PROJECT_ROOT}/bootloader/data                                         
export UBOOT_IMAGE=${DATA}/u-boot

QEMU_AUDIO_DRV=none qemu-system-arm -M ${QEMU_MACHINE} -m 128M -nographic \
  -kernel ${UBOOT_IMAGE} \
  -drive file=${DATA}/pflash0.img,if=pflash,format=raw \
  -drive file=${DATA}/pflash1.img,if=pflash,format=raw \
  -drive file=${DATA}/sd.img,if=sd,format=raw
#  -S -s

