#!/bin/bash

[[ $DEBUG ]] && set -x

DEFAULT_PERSISTENT_DIR="/data"
APP_PERSISTENT_DIR="data app config"

for dir in $APP_PERSISTENT_DIR
do
    if [ ! -d /${DEFAULT_PERSISTENT_DIR}/${dir} ];then
        mv /var/www/html/${dir} ${DEFAULT_PERSISTENT_DIR}
        chown www-data.www-data /${DEFAULT_PERSISTENT_DIR}/${dir} -R
    else 
        mv /var/www/html/${dir} /var/www/html/${dir}.bak 
    fi
    ln -s /${DEFAULT_PERSISTENT_DIR}/${dir} /var/www/html/${dir}
done

sleep ${PAUSE:-0}
exec "$@"
