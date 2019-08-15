#!/bin/bash


apt update
apt install apache2 -y

# Install essential packages
apt-get -y install zsh htop

# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
echo "mysql-server-5.7 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | sudo debconf-set-selections
apt-get -y install mysql-server-5.7


sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf
mysql -uroot -proot -e 'USE mysql; UPDATE `user` SET `Host`="%" WHERE `User`="root" AND `Host`="localhost"; DELETE FROM `user` WHERE `Host` != "%" AND `User`="root"; CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password'; FLUSH PRIVILEGES;'

service mysql restart


apt install php php-mysql -y
service apache2 restart

# mkdir /var/run/mysqld
# touch /var/run/mysqld/mysqld.sock
# chown -R mysql /var/run/mysqld
# /etc/init.d/mysql restart


cd /var/www/html
wget http://wordpress.org/latest.tar.gz

tar -xzvf latest.tar.gz

cd /var/www/html/wordpress/

mv wp-config-sample.php wp-config.php

sed -i "s/database_name_here/wordpress/g" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/root/g" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/password/g" /var/www/html/wordpress/wp-config.php

mkdir wp-content/uploads
chmod 777 wp-content/uploads

rm /var/www/html/latest.tar.gz