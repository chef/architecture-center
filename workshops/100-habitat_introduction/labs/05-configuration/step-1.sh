#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

hab origin key generate demo
hab pkg install core/curl -b
hab pkg install core/jq-static -b
build

hab svc load demo/service --strategy at-once --update-condition latest -f