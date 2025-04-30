#!/bin/bash

DOCKER=$(which docker)

if [ -z "${DOCKER}" ]; then
    echo "Installing docker as it is required for this lab"
    INSTALL=$(sudo yum install docker -y)
fi

chef-node-management-cli management skill create-skill --body-file step-2.sh.json | jq
