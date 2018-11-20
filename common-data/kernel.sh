#!/bin/sh

# Descargamos el kernel
git clone -b v4.18.9 --depth 1 \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd linux-stable

# Compiamos la configuración pre-armada
cp ../data/linux.config .config

# Generamos u-boot
make -j 4

