#!/bin/bash

clear
set -x

hab svc stop demo/server

{ set +x; } 2>/dev/null

echo ""