#!/bin/bash

STATUS=$(chef-node-management-cli management node find-one-node --nodeId $NODE1 --format json --profile admin | jq -r '.item.enrollmentLevel')
echo "Node 1 status = $STATUS"

STATUS=$(chef-node-management-cli management node find-one-node --nodeId $NODE2 --format json --profile admin  | jq -r '.item.enrollmentLevel')
echo "Node 2 status = $STATUS"

STATUS=$(chef-node-management-cli management node find-one-node --nodeId $NODE3 --format json --profile admin  | jq -r '.item.enrollmentLevel')
echo "Node 3 status = $STATUS"