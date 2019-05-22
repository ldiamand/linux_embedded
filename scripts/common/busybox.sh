#!/bin/sh

# Cargamos las varialbes de entorno
. setenv.sh

cd ${PROJECT_ROOT}/sysapps

# No va otra variable definida en el script principal                           
export DATA=${PROJECT_ROOT}/sysapps/data                                         

git clone git://busybox.net/busybox.git                                         
cd busybox                                                                      
git checkout ${BUSYBOX_VERSION}

cp ${DATA}/busybox.config .config

make -j8

make install

