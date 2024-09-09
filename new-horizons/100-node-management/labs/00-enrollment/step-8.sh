#!/bin/bash

STATUS=$(chef-node-management-cli management node find-one-node --nodeId $VSCODE --format json --profile admin | jq -r '.item.enrollmentLevel')
echo "VSCode status = $STATUS"
