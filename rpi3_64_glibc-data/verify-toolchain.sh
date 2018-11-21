#!/bin/sh

# Verificamos la salida de gcc
file data/hello_static | grep -q 'ELF 64-bit LSB executable, ARM aarch64, version 1 (GNU/Linux), statically linked' && \
    echo 'Compilación con bibliotecas estáticas... OK'

# Verificamos la ejecución con bibliotecas estáticas
qemu-arm data/hello_static | grep -q 'Hola Mundo' \
    && echo 'Ejecución con bibliotecas estáticas... OK'

# Verificamos la salida de make
file data/hello | grep -q 'ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1' && \
    echo 'Compilación con bibliotecas dinamicas... OK'

# Verificamos la ejecución con bibliotecas dinámicas
qemu-arm -L `arm-linux-gcc -print-sysroot` data/hello | grep -q 'Hola Mundo' \
    && echo 'Ejecución con bibliotecas dinámicas... OK'

