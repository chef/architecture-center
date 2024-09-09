#!/bin/bash

chef-node-management-cli status get-status --nodeId $NODE1  --format json --profile admin | jq