#!/bin/bash

FILTERS=$(chef-node-management-cli management list find-all-lists --format json --profile admin)

SUPPRTED=$(echo $FILTERS | jq -br '.pagination.totalPages')


if [[ $SUPPRTED == "1" ]]; then
    LISTID=$(echo $FILTERS | jq -br '.items[] | select(.name == "worker-nodes") | .id'  )
    RESULTS=$(chef-node-management-cli management list find-one-list --listId $LISTID --format json --profile admin --expand true)
    echo $RESULTS | jq '[ .item.nodes[] | {id: .id, checkedInAt: .checkedinAt} ]'
else 
    echo "This script does not expect there to be multiple pages of saved filters".
fi
