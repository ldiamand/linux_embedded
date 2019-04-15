#!/bin/sh

# No va otra variable definida en el script principal                           
export DATA=${PROJECT_ROOT}/bootloader/data                                         
export UBOOT_IMAGE=${DATA}/u-boot

QEMU_AUDIO_DRV=none qemu-system-arm -M vexpress-a9 -m 128M -nographic \
  -kernel ${UBOOT_IMAGE}

