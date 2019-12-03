#!/bin/bash
#
##################################################################################################################
# Version   :   1.0
# Author 	:   vekio
# Purpose   :   run all containers with the docker-compose file and set up all files they need in the volumes
##################################################################################################################

DOCKERPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Run docker-compose
docker-compose -f $DOCKERPATH up -d

# Run containers script to put files in the volumes
bash $DOCKERPATH/pihole.sh
