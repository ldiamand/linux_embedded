#!/bin/sh

# Construimos el juego de herramientas
crosstool-ng.sh

# Construimos el gestor de arranque
u-boot.sh

# Construimos el kernel
kernel.sh

# Construimos el sistema de archivos
busybox.sh

