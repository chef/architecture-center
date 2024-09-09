#!/bin/bash

clear
set -x

hab svc status

{ set +x; } 2>/dev/null

echo ""