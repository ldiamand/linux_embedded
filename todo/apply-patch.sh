#!/bin/sh

meld u-boot_$1/arch/arm/lib/bootm.c u-boot_$2/arch/arm/lib/bootm.c 
meld u-boot_$1/board/ti/am335x/ u-boot_$2/board/ti/am335x/ 
meld u-boot_$1/include/configs/ti_armv7_common.h u-boot_$2/include/configs/ti_armv7_common.h 
meld u-boot_$1/drivers/ u-boot_$2/drivers/
meld u-boot_$1/configs/am335x_boneblack_defconfig u-boot_$2/configs/am335x_boneblack_defconfig


cd u-boot_$2
make clean
make mrproper
make distclean
make am335x_boneblack_config
make -j2

upgrade_uboot
