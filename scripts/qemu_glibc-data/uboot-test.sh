#!/bin/sh
QEMU_AUDIO_DRV=none qemu-system-arm -M vexpress-a9 -m 128M -nographic \
  -kernel bootloader/u-boot/u-boot
