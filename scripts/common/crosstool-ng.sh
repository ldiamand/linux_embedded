#!/bin/sh

# Limpiamos la variable de entorno LD_LIBRARY_PATH
unset LD_LIBRARY_PATH

# Cargamos las varialbes de entorno
. setenv.sh

# Vamos al directorio de trabajo
cd ${PROJECT_ROOT}/build-tools

# Descargamos crosstool-ng
git clone https://github.com/crosstool-ng/crosstool-ng.git
git checkcout crosstool-ng-1.24.0
cd crosstool-ng/

# Traemos la versión a compilar
git checkout crosstool-ng-${CROSSTOOL_NG_VERSION}

# Construimos crosstool-ng (TODO: ver cuando este corregido el bug de
# --enable-local
./bootstrap
./configure --prefix=`pwd`
#./configure --enable-local
make && make install

# Compiamos la configuración pre-armada
cp ${PROJECT_ROOT}/build-tools/data/crosstool-ng.config .config

# Actualizamos la configuración dado que estamos trabajando
# con el master (lo hacemos igualmente por si el archivo es anterior)
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

