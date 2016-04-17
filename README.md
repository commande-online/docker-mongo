# docker-mongo
Docker configuration for running the MongoDB service for Commande-Online.fr SAS

## Before using for your own security
Please update the password provided in the /init/user-[admin|prod].js files. Those should only be used in a DEV env and **NOT IN PRODUCTION OR STAGING**

## Instruction
Simply execute the Dockerfile to build the environment

If you want to automatically import data mount /init-data

## Known issues
On windows, mounting a folder for /data/db doesn't work
