#!/bin/bash
ver=$1
cd /opt/lnmp/phpext
tar xzf redis-${ver}.tgz
cd redis-${ver}
/usr/local/php56/bin/phpize
./configure --with-php-config=/usr/local/php56/bin/php-config --enable-redis
make && make install
sed  -i 's%ext-redis-php56-%%g' /usr/local/php56/etc/php.ini
