#!/bin/sh
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
service mysql start;
mysql  -uroot --skip-password --execute "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql  -uroot  --skip-password -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql  -uroot --skip-password -e  "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql  -uroot  --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -uroot  -p$SQL_ROOT_PASSWORD  -e "FLUSH PRIVILEGES;"
echo ee
mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown
echo ff
exec mysqld
echo gg