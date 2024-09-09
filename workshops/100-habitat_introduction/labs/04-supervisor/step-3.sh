#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

clear

cd /src/services/service-1
build
hab svc load demo/service_1 --strategy at-once --update-condition latest -f

cd /src/services/service-2
build
hab svc load demo/service_2 --strategy at-once --update-condition latest -f

cd /src/services/service-3
build
hab svc load demo/service_3 --strategy at-once --update-condition latest -f

cd /src

clear

echo ""