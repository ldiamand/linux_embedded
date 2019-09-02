#!/bin/sh

export WORK=${PROJECT_ROOT}/bootloader
export DATA=${WORK}/data

cd ${WORK}

# Descargamos los archivos propietarios de la raspberry pi
git clone --depth 1 https://github.com/raspberrypi/firmware

# Copiamos los archivos al directorio data
cp -iv ${WORK}/firmware/boot/{bootcode.bin,fixup.dat,start.elf} ${DATA}

