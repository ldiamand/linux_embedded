#!/bin/sh

# Cargamos las varialbes de entorno                                             
. setenv.sh

# Vamos al directorio de trabajo
cd ${PROJECT_ROOT}/kernel

# Descargamos el kernel
git clone -b ${LINUX_KERNEL_VERSION} --depth 1 \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd linux-stable

# Compiamos la configuración pre-armada
cp ${PROJECT_ROOT}/kernel/data/linux.config .config

# Actualizamos el config
make olddefconfig

# Generamos u-boot
make -j 8

# Copiamos el kernel generado a la carpeta data
cp ${KERNEL_PATH}/${KERNEL_IMAGE} ${PROJECT_ROOT}/kernel/data

# Copiamos el dtb generado a la carpeta data
cp ${DTB_PATH}/${DTB_IMAGE} ${PROJECT_ROOT}/kernel/data

