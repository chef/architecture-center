#!/bin/bash

chef-node-management-cli management node find-one-node --nodeId $NODE1 --format json --profile admin  | jq '.item.attributes'