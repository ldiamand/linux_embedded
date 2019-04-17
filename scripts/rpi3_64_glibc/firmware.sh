#!/bin/sh

# Descargamos los archivos propietarios de la raspberry pi
git clone --depth 1 https://github.com/raspberrypi/firmware

# Copiamos los archivos al directorio data
cp -iv firmware/boot/{bootcode.bin,fixup.dat,start.elf} data/

