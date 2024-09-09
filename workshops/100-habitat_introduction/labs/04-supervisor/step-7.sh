#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

clear

function explore() {
    SERVICE=$1
    PAYLOAD=$(curl -s http://localhost:9631/services/$SERVICE/default)
    echo ""
    echo "Let's learn about service 1"
    echo "--------------------------------------"
    echo ""
    echo "+ curl -s http://localhost:9631/services/$SERVICE/default"
    echo ""
    echo "What dependencies does it have?"
    echo "+ jq '.pkg.dependencies'"
    echo $PAYLOAD | jq '.pkg.dependencies'
    echo ""    
    echo "What version is running?"
    echo "+ jq '.pkg'"
    echo $PAYLOAD | jq '{ name: .pkg.name, origin: .pkg.origin, version: .pkg.version, release: .pkg.release }'
    echo ""    
    echo "Does it use any hooks?"
    echo "+ jq '.hooks'"
    echo $PAYLOAD | jq '.hooks'
}

explore "service_3"