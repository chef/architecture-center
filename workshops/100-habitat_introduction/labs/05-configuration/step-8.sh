#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

echo "Pulling Config from the Ring"
echo "--------------------------------------"
echo "+ ccurl -s http://localhost:9631/census"
curl -s curl -s http://localhost:9631/census | jq '{ cfg: .census_groups."service.default".service_config }'