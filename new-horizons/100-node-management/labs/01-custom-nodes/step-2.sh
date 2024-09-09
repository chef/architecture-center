#!/bin/bash
BODY="{\"Id\": \"$WRT\", \"Source\": \"discovery\", \"cohortId\": \"a494d057-5bda-4466-841e-cf72fb753943\"}"
#echo $BODY
chef-node-management-cli management node create-node --body "$BODY" --body-format json --format json --profile admin | jq