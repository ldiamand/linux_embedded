#!/bin/sh

export DATA=${PROJECT_ROOT}/build-tools/data

# Verificamos la salida de gcc
file ${DATA}/hello_static | grep -q 'ELF 64-bit LSB executable, ARM aarch64, version 1 (GNU/Linux), statically linked' && \
    echo 'Compilación con bibliotecas estáticas... OK'

# Verificamos la salida de make
file ${DATA}/hello | grep -q 'ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1' && \
    echo 'Compilación con bibliotecas dinamicas... OK'

