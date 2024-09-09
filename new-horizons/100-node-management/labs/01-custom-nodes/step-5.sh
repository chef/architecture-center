#!/bin/bash
chef-node-management-cli management node find-one-node --nodeId $WRT --format json --profile admin | jq