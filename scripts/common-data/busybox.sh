#!/bin/sh

git clone git://busybox.net/busybox.git                                         
cd busybox                                                                      
git checkout 1_30_1     

cp ../data/busybox.config .config

make -j8

make install

