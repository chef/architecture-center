#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

mkdir -p /hab/user/service/config/
cp step-3.sh.toml /hab/user/service/config/user.toml