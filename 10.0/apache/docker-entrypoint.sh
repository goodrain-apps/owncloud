#!/bin/bash

[ $DEBUG ] && set -x
chown -R www-data /data

if [ ! -d /data ];then
    mv /var/www/html/data /data
   fi
else 
    mv /var/www/html/data /var/www/html/data.bak 
fi 

ln -s /data/data /var/www/html/data

sleep ${PAUSE:-0}
exec "$@"
