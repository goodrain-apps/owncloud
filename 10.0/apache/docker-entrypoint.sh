#!/bin/bash

[ $DEBUG ] && set -x






chown -R www-data /data

sleep ${PAUSE:-0}

exec "$@"
