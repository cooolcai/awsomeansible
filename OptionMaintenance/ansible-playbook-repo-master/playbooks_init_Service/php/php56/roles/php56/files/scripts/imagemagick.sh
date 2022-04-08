#!/bin/bash
ver=$1
cd /opt/lnmp/
tar xf  ImageMagick-${ver}.tar
cd ImageMagick-${ver}
./configure -prefix=/usr/local/imageMagick --disable-openmp
make -j`grep -c processor /proc/cpuinfo` && make install
