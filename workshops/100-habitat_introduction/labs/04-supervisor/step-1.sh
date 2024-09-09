#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

hab origin key generate demo
hab pkg install core/jq-static -b
hab pkg install core/curl -b
