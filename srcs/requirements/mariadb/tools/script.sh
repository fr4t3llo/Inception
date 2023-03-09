#!/bin/bash

ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
NAMEDB=$DB_NAME
USER=$MYSQL_USER
USERPASS=$MYSQL_PASSWORD

service mysql start

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

sleep 2
mysql -u root -e "CREATE DATABASE $NAMEDB;"
mysql -u root -e "CREATE USER '$USER'@'%' IDENTIFIED BY '$USERPASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $NAMEDB.* TO '$USER'@'%';"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"
mysql -u root -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
# sleep 100000

# sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i 's/#port                   = 3306/port                   = 3306/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# service mysql start 
# echo "CREATE DATABASE $DB_NAME;" | mysql -u root 
# echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
# echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%';" | mysql -u root
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
# echo "FLUSH ALL PRIVILEGES;" | mysql -u root

# kill $(cat /var/run/mysqld/mysqld.pid) 
# mysqld