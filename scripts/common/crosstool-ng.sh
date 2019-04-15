#!/bin/sh

# Limpiamos la variable de entorno LD_LIBRARY_PATH
unset LD_LIBRARY_PATH

# Vamos al directorio de trabajo
cd ${PROJECT_ROOT}/build-tools

# Descargamos crosstool-ng
git clone https://github.com/crosstool-ng/crosstool-ng.git
cd crosstool-ng/

# Construimos crosstool-ng
./bootstrap
./configure --prefix=`pwd`
make && make install

# Compiamos la configuración pre-armada
cp ${PROJECT_ROOT}/build-tools/data/crosstool-ng.config .config

# Actualizamos la configuración dado que estamos trabajando
# con el master
./ct-ng upgradeconfig

# Generamos el juego de herramientas
./ct-ng build

# Limpiamos el entorno
./ct-ng clean

cd ${PROJECT_ROOT}/build-tools/data

# Probamos el juego de herramientas
${CROSS_COMPILE}gcc --static hello.c -o hello_static

# Probamos el Makefile
make

# Verificamos los generados
verify-toolchain.sh

