#!/bin/bash
BODY="{\"name\": \"worker-nodes\", \"nodeIds\": [ \"$NODE1\", \"$NODE2\", \"$NODE3\" ] }"
chef-node-management-cli management list create-list --body "$BODY" --body-format json --format json --profile admin | jq