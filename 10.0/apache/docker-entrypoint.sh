#!/bin/bash
set -e

[[ $DEBUG ]] && set -x 

if [ ! -e '/var/www/html/version.php' ]; then
	tar cf - --one-file-system -C /usr/src/owncloud . | tar xf -
	chown -R www-data /var/www/html
fi

sleep ${PAUSE:-0}

exec "$@"
