#!/bin/sh

# Descargamos u-boot
git clone git://git.denx.de/u-boot.git
cd u-boot
git checkout v2018.09

# Compiamos la configuración pre-armada
cp ../data/u-boot.config .config

# Generamos u-boot
make

