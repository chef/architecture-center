#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

echo ""
echo "is hello installed?"
echo "---------------------------"
echo ""
hello
echo ""
echo 

hab pkg list --origin demo