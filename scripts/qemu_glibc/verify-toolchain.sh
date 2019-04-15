#!/bin/sh

# No va otra variable definida en el script principal                           
export DATA=${PROJECT_ROOT}/build-tools/data                                         

# Verificamos la salida de gcc
file ${DATA}/hello_static | grep -q 'ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked' && \
    echo 'Compilación con bibliotecas estáticas... OK'

# Verificamos la ejecución con bibliotecas estáticas
qemu-arm ${DATA}/hello_static | grep -q 'Hola Mundo' \
    && echo 'Ejecución con bibliotecas estáticas... OK'

# Verificamos la salida de make
file ${DATA}/hello | grep -q 'ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3' && \
    echo 'Compilación con bibliotecas dinamicas... OK'

# Verificamos la ejecución con bibliotecas dinámicas
qemu-arm -L `${CROSS_COMPILE}gcc -print-sysroot` ${DATA}/hello | grep -q 'Hola Mundo' \
    && echo 'Ejecución con bibliotecas dinámicas... OK'

