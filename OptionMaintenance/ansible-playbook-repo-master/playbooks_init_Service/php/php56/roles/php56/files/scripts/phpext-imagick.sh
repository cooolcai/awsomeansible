#!/bin/bash
ver=$1
cd /opt/lnmp/phpext
tar xzf imagick-${ver}.tgz
cd imagick-${ver}
/usr/local/php56/bin/phpize 
./configure --with-php-config=/usr/local/php56/bin/php-config --with-imagick=/usr/local/imageMagick/
make  && make install
sed  -i 's%ext-imagick-php56-%%g' /usr/local/php56/etc/php.ini
