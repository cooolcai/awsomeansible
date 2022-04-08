#!/bin/bash                          
ver=$1                
cd /opt/lnmp/phpext/  
tar xzf memcached-${ver}.tgz
cd memcached-${ver}
/usr/local/php56/bin/phpize
./configure -enable-memcached -with-php-config=/usr/local/php56/bin/php-config -with-zlib-dir -with-libmemcached-dir=/usr/local/libmemcached -prefix=/usr/local/phpmemcached
make && make install
sed  -i 's%ext-memcached-php56-%%g' /usr/local/php56/etc/php.ini
