#!/usr/bin/env bash

#dynamic image pull from privte repo
export IMAGE = $1

#all the codes to run
docker-compose -d -f docker-compose.yml up
echo "very nice"