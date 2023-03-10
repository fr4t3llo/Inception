#!/bin/bash
mkdir -p /var/www/adminer
wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php 
chown -R www-data:www-data /var/www/html/adminer.php 
chmod 755 /var/www/html/adminer.php
service php7.3-fpm start
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:3306/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php
/usr/sbin/php-fpm7.3 -F