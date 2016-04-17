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

    echo "## Launching mongo in WiredTiger mode with auth enabled"
	gosu mongodb "$@" --storageEngine wiredTiger & #--auth --setParameter enableLocalhostAuthBypass=0 &

	#echo "help"
	#exec help

    # from https://github.com/tutumcloud/mongodb/blob/master/3.2/set_mongodb_password.sh
	RET=1
    while [[ RET -ne 0 ]]; do
        echo "=> Waiting for confirmation of MongoDB service startup"
        sleep 5
        mongo admin --eval "help" >/dev/null 2>&1
        RET=$?
    done

    USERS=`mongo --quiet --eval "db.system.users.find({user:'admin'}).count()" admin`

    echo "## Checking if the user admin as already been created : $USERS"

	if [ "$USERS" -eq 0 ]
	then
	    echo "## Creating the admin user"
        mongo admin /init-DB/user-admin.js

        echo "## Creating the app user"
        mongo admin /init-DB/user-prod.js
    fi

    # Shutdown of Mongo
    echo "## Users have been created, we relaunch mongo to enable auth"
    gosu mongodb "$@" --shutdown

	exec gosu mongodb "$@" --storageEngine wiredTiger --auth --setParameter enableLocalhostAuthBypass=0

fi

exec "$@"
