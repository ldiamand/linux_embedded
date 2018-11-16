#!/bin/sh
QEMU_AUDIO_DRV=none qemu-system-arm -M vexpress-a9 -m 128M -nographic \
  -kernel bootloader/u-boot/u-boot \
  -net nic -net tap,ifname=tap0,script=no,downscript=no \
  -drive file=./bootloader/pflash0.img,if=pflash,format=raw \
  -drive file=./bootloader/pflash1.img,if=pflash,format=raw \
  -drive file=./bootloader/sd.img,if=sd,format=raw #\
#  -serial pty
