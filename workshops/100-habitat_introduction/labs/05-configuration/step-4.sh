#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

set -x
curl localhost:8001