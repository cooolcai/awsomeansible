#!/bin/bash
ver=$1
cd /opt/lnmp/phpext
tar xzf memcache-${ver}.tgz 
cd memcache-${ver}
/usr/local/php56/bin/phpize 
./configure --enable-memcache --with-php-config=/usr/local/php56/bin/php-config
make  && make install
sed  -i 's%ext-memcache-php56-%%g' /usr/local/php56/etc/php.ini
