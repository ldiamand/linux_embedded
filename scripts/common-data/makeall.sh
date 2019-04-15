#!/bin/sh

cd build-tools
./crosstool-ng.sh
cd ..

cd bootloades
./u-boot.sh
cd ..

cd kernel
./kernel.sh
cd ..

cd sysapps
./busybox.sh
cd ..

