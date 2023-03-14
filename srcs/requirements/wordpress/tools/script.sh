#!/bin/bash
#env files
DATABASE_USER=$MYSQL_USER
DATABASE_NAME=$DB_NAME
DATABASE_PASS=$MYSQL_PASSWORD

# Wait for MySQL to start
mkdir -p /run/php
mkdir -p /var/www/html
service php7.3-fpm start
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html
rm -rf *
wp core download --allow-root
cp wp-config-sample.php wp-config.php
wp config set DB_HOST mariadb --type=constant --allow-root
sed -i "68s/.*/define('WP_REDIS_HOST', 'redis');/" /var/www/html/wp-config.php
sed -i "70s/.*/define('WP_REDIS_PORT', 6379);/" /var/www/html/wp-config.php
sed -i "71s/.*/define('WP_CACHE', true);/" /var/www/html/wp-config.php

sed -i -e "s/database_name_here/${DB_NAME}/g" /var/www/html/wp-config.php
sed -i -e "s/username_here/${MYSQL_USER}/g" /var/www/html/wp-config.php
# sed -i -e "s/localhost/mariadb/g" /var/www/html/wp-config.php
sed -i -e "s/password_here/${MYSQL_PASSWORD}/g" /var/www/html/wp-config.php
wp core install --url=https://${DOMAIN_NAME} --title="My Own Website" --admin_user=${MYSQL_USER} --admin_password=${MYSQL_PASSWORD} --admin_email=saife.addine123@gmail.com --allow-root
wp user create ${AUTHOR_USER} test@gmail.com --role=author --user_pass=${AUTHOR_PASS} --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root
wp theme install twentytwentyone --activate --allow-root
wp redis enable --allow-root
/usr/sbin/php-fpm7.3 -F