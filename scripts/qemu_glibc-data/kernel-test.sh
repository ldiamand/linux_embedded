#!/bin/sh
QEMU_AUDIO_DRV=none qemu-system-arm -M vexpress-a9 -m 128M -nographic \
  -kernel kernel/data/zImage -dtb kernel/data/vexpress-v2p-ca9.dtb
