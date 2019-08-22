#!/bin/sh

# Cargamos las varialbes de entorno
. setenv.sh

# Vamos al directorio de trabajo
cd ${PROJECT_ROOT}/qemu

# Descargamos crosstool-ng
git clone -b ${QEMU_VERSION} --depth 1 git://git.qemu-project.org/qemu.git
cd qemu/

# Traemos la versión a compilar
git checkout ${QEMU_VERSION}

# Agregamos la plataforma nova 
patch -p 1 < ${PROJECT_ROOT}/qemu/data/nova_qemu_4.0.0.patch

# Construimos qemu
mkdir build
cd build
../configure --target-list=arm-softmmu --prefix=${PROJECT_ROOT}/tools/qemu
make -j8 && make install

