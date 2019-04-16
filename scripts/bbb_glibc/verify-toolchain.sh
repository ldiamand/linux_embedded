#!/bin/sh

export DATA=${PROJECT_ROOT}/build-tools/data

# TODO actualiza
# Verificamos la salida de gcc
file ${DATA}/hello_static | grep -q 'ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked' && \
    echo 'Compilación con bibliotecas estáticas... OK'

# TODO actualizar
# Verificamos la salida de make
file ${DATA}/hello | grep -q 'ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3' && \
    echo 'Compilación con bibliotecas dinamicas... OK'


