#!/bin/bash           
ver=$1                
cd /opt/lnmp/phpext/ 
tar -zxvf libiconv-${ver}.tar.gz 
cd libiconv-${ver}
./configure --prefix=/usr/local/libiconv
make -j`grep -c processor /proc/cpuinfo` && make install
