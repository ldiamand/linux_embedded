#!/bin/sh

# No va otra variable definida en el script principal                           
export DATA=${PROJECT_ROOT}/sysapps/data                                         

git clone git://busybox.net/busybox.git                                         
cd busybox                                                                      
git checkout 1_30_1     

cp ${DATA}/busybox.config .config

make -j8

make install

