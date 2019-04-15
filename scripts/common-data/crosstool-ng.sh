#!/bin/sh

# Descargamos crosstool-ng
git clone https://github.com/crosstool-ng/crosstool-ng.git
cd crosstool-ng/

# Construimos crosstool-ng
./bootstrap
./configure --prefix=`pwd`
make && make install

# Compiamos la configuración pre-armada
cp ../data/crosstool-ng.config .config

# Actualizamos la configuración dado que estamos trabajando
# con el master
./ct-ng upgradeconfig

# Generamos el juego de herramientas
./ct-ng build

# Limpiamos el entorno
./ct-ng clean

cd ../data

# Probamos el juego de herramientas
${CROSS_COMPILE}gcc --static hello.c -o hello_static

# Probamos el Makefile
make

cd ..

# Verificamos los generados
./verify-toolchain.sh

