#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

echo ""
echo "How many services are running?"
echo "----------------------------------"
echo ""
echo "+ curl -s http://localhost:9631/services"

curl -s http://localhost:9631/services | jq