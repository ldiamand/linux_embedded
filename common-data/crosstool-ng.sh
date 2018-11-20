#!/bin/sh

git clone https://github.com/crosstool-ng/crosstool-ng.git
cd crosstool-ng/
./bootstrap
./configure --prefix=`pwd`
make && make install

cp ../data/crosstool-ng.config .config
./ct-ng build

