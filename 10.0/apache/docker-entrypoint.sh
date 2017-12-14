#!/bin/bash

[ $DEBUG ] && set -x
chown -R www-data /data

ln -s /data /var/www/html/data

sleep ${PAUSE:-0}
exec "$@"
