#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

echo ""
echo "is curl installed?"
echo "---------------------------"
echo ""
curl --version

echo ""