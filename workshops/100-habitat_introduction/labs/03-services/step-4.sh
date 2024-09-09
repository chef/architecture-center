#!/bin/bash

clear
set -x

curl http://localhost:8001

{ set +x; } 2>/dev/null

echo ""