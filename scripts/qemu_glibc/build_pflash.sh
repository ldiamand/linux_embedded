#!/bin/sh

export DATA=${PROJECT_ROOT}/bootloader/data

dd if=/dev/zero of=${DATA}/pflash0.img bs=1M count=64
dd if=/dev/zero of=${DATA}/pflash1.img bs=1M count=64

dd if=/dev/zero of=${DATA}/sd.img bs=1M count=16
mkfs.vfat ${DATA}/sd.img

