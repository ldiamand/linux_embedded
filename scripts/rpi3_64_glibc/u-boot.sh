#!/bin/sh

export WORK=${PROJECT_ROOT}/bootloader
export DATA=${WORK}/data

cd ${WORK}

# Descargamos u-boot
git clone git://git.denx.de/u-boot.git
cd u-boot
git checkout v2019.04

# Compilamos la configuración pre-armada
cp ${DATA}/u-boot.config .config

# Generamos u-boot
make -j8

# Copiamos el u-boot generado a la carpeta data
cp ${UBOOT_PATH}/${UBOOT_IMG} ${DATA}

# Corregir el compilador para herramientas nativas
# Ver porque pide el /etc/fw_env.config.
# Compilamos las herramientas de entorno
#make -j8 envtools

# y lo instalamos en la carpeta bin
#ln -s tools/env/fw_printenv ${PROJECT_ROOT}/bin
#ln -s tools/env/fw_printenv ${PROJECT_ROOT}/bin/fw_setenv

