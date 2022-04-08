#!/bin/bash
ver=$1
cd /opt/lnmp/phpext/
tar xzf libmemcached-${ver}.tar.gz
cd libmemcached-${ver}
./configure -prefix=/usr/local/libmemcached -with-memcached 
make -j`grep -c processor /proc/cpuinfo` && make install
