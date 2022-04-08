#!/bin/bash
ver=$1
tar xf /opt/lnmp/php-${ver}.tar.gz -C /opt/lnmp/ 
cd /opt/lnmp/php-${ver} 
./configure --prefix=/usr/local/php56 --with-config-file-path=/usr/local/php56/etc/ \
    --with-mysql=mysqlnd \
    --with-mysqli=mysqlnd \
    --with-pdo-mysql=mysqlnd \
    --with-gd \
    --with-zlib \
    --with-png-dir \
    --with-freetype-dir \
    --with-jpeg-dir \
    --with-tidy \
    --with-iconv \
    --with-pear \
    --with-pcre-dir \
    --with-mcrypt \
    --with-openssl \
    --with-curl \
    --with-gmp \
    --with-curlwrappers \
    --enable-mbregex \
    --enable-mbstring=all \
    --enable-zip \
    --enable-exif \
    --enable-fpm \
    --enable-ftp \
    --enable-pcntl \
    --enable-soap \
    --enable-sockets \
    --enable-pdo \
    --enable-zend-multibyte \
    --enable-gd-native-ttf \
    --enable-safe-mode \
    --enable-sqlite-utf8 \
    --enable-cli \
    --disable-debug

make -j`grep -c processor /proc/cpuinfo` > /dev/null 
make install > /dev/null 
\cp -f /opt/lnmp/php-fpm.conf /usr/local/php56/etc/php-fpm.conf 
\cp -f /opt/lnmp/php.ini /usr/local/php56/etc/php.ini 
ln -s /usr/local/php/bin/php* /usr/local/bin/
/usr/local/php56/bin/php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
/usr/local/php56/bin/php composer-setup.php
mv composer.phar /usr/local/bin/composer
