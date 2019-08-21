#!/bin/sh

# Cargamos las varialbes de entorno
. setenv.sh

# Vamos al directorio de trabajo
cd ${PROJECT_ROOT}/tools

# Descargamos crosstool-ng
git clone git://git.qemu-project.org/qemu.git
cd qemu/

# Traemos la versión a compilar
git checkout ${QEMU_VERSION}

# Construimos qemu
mkdir build
cd build
./configure --target=`pwd`
make && make install

# Compiamos el binario generado
ln -s ${PROJECT_ROOT}/tools/qemu/arm-softmmu/qemu-system-arm ${PROJECT_ROOT}/bin/qemu-system-arm4

