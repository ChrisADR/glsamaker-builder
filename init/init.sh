#!/bin/bash
MYSQL_USER=root
MYSQL_PASSWORD=glsamaker

mysqld_safe&
cd /glsamaker

cp /config/database.yml /glsamaker/config/
cp /config/glsamaker.rb /glsamaker/config/

#prepare database
if [ ! -f /configured ];then
./bin/setup
mysql --user=$MYSQL_USER --password=$MYSQL_PASSWORD < /database/bugzilla.sql
mysql --user=$MYSQL_USER --password=$MYSQL_PASSWORD < /database/glsamaker.sql
/var/www/localhost/htdocs/bugzilla/checksetup.pl 
fi

apache2 -DDEFAULT_VHOST


#generate bugzilla tables
if [ ! -f /configured ];then
/var/www/localhost/htdocs/bugzilla/checksetup.pl /config/checksetup.conf
fi

touch /configured
./bin/rails server -b 0.0.0.0
