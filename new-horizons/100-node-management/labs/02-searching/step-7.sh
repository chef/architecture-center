#!/bin/bash

FILTERS=$(chef-node-management-cli management filter find-all-filters --format json --profile admin)

SUPPRTED=$(echo $FILTERS | jq -br '.pagination.totalPages')


if [[ $SUPPRTED == "1" ]]; then
    FILTERID=$(echo $FILTERS | jq -br '.items[] | select(.name == "worker-nodes") | .id'  )
    RESULTS=$(chef-node-management-cli management filter run-savedFilter --filterId $FILTERID --expand "false"  --format json --profile admin)
    echo $RESULTS | jq '[ .items[] | {id: .id, checkedInAt: .checkedinAt} ]'
    echo ""
    echo $RESULTS | jq ' .pagination '
else 
    echo "This script does not expect there to be multiple pages of saved filters".
fi
