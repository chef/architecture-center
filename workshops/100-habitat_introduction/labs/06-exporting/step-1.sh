#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

hab pkg install chef/chef-infra-client/18.5.0