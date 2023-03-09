#!/bin/bash
#env files

DATABASE_USER=$MYSQL_USER
DATABASE_NAME=$DB_NAME
DATABASE_PASS=$MYSQL_PASSWORD

# Wait for MySQL to start

# DB_NAME=$DBNAME
# DB_USER=$MYSQL_USER

# DB_PASS=$MYSQL_PASSWORD

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
sed -i -e "s/database_name_here/${DB_NAME}/g" /var/www/html/wp-config.php
sed -i -e "s/username_here/${MYSQL_USER}/g" /var/www/html/wp-config.php
# sed -i -e "s/localhost/mariadb/g" /var/www/html/wp-config.php
sed -i -e "s/password_here/${MYSQL_PASSWORD}/g" /var/www/html/wp-config.php
wp core install --url=localhost --title="My Own Website" --admin_user=skasmi --admin_password=SAIFEsaife123 --admin_email=saife.addine123@gmail.com --skip-email --allow-root
# wp user create fratello test@gmail.com --role=co_founder --user_pass=123fratello --allow-root
/usr/sbin/php-fpm7.3 -F