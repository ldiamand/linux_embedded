#!/bin/sh

dd if=/dev/zero of=./data/pflash0.img bs=1M count=64
dd if=/dev/zero of=./data/pflash1.img bs=1M count=64

dd if=/dev/zero of=./data/sd.img bs=1M count=16
mkfs.vfat ./data/sd.img

