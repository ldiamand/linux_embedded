#!/bin/sh

# Descargamos u-boot
git clone git://git.denx.de/u-boot.git
cd u-boot
git checkout v2019.04

# Compiamos la configuración pre-armada
cp ../data/u-boot.config .config

# Generamos u-boot
make

# Copiamos el u-boot generado a la carpeta data
cp ${UBOOT_PATH}/${UBOOT_IMG} ../data

