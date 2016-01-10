#!/bin/bash
set -e


if [ "${1:0:1}" = '-' ]; then
	set -- mongod "$@"
fi

if [ "$1" = 'mongod' ]; then
	chown -R mongodb:mongodb /data/db

	numa='numactl --interleave=all'
	if $numa true &> /dev/null; then
		set -- $numa "$@"
	fi

	exec gosu mongodb "$@" --storageEngine wiredTiger
    exec mongo /init-DB/user-admin.js
    exec mongo /init-DB/user-prod.js
fi

exec "$@"