# docker-mongo
Docker configuration for running the MongoDB service for Commande-Online.fr SAS

## Before using for your own security
Please update the password provided in the /init/user-*.js files. Those should only be used in a DEV env and NOT IN PRODUCTION

## Instruction
Simply execute the Dockerfile to build the environment

## Known issues
On windows, mounting a folder for /data/db doesn't seems to be working
