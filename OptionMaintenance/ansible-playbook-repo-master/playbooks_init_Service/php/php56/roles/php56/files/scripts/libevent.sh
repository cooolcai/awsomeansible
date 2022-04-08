#!/bin/bash           
ver=$1                
cd /opt/lnmp/phpext/ 
tar xzf libevent-${ver}-stable.tar.gz
cd /opt/lnmp/phpext/libevent-${ver}-stable
./configure --prefix=/usr/local/libevent
make -j`grep -c processor /proc/cpuinfo` && make install
