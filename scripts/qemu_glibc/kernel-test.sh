#!/bin/sh

# No va otra variable definida en el script principal
export DATA=${PROJECT_ROOT}/kernel/data
export KERNEL_IMAGE=${DATA}/zImage
export DTB_IMAGE=${DATA}/vexpress-v2p-ca9.dtb

QEMU_AUDIO_DRV=none qemu-system-arm -M vexpress-a9 -m 128M -nographic \
  -kernel ${KERNEL_IMAGE} -dtb ${KERNEL_IMAGE}

