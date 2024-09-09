#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

IDENT=$(date +%s)
hab config apply service.default $IDENT step-5.sh.toml