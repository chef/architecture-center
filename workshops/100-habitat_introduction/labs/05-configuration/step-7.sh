#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

echo "Pulling Config from the supervisor"
echo "--------------------------------------"
echo "+ curl -s http://localhost:9631/services/service/default"
curl -s http://localhost:9631/services/service/default | jq '{ cfg: .cfg }'