#!/bin/bash

BODY="[{ \"name\": \"name\", \"value\": \"OpenWRT\" }]"

chef-node-management-cli management node modify-tags --body "$BODY" --body-format json --nodeId $WRT --format json --profile admin | jq