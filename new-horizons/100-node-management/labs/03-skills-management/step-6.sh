#!/bin/bash

#!/bin/bash

NODE=$(chef-node-management-cli management node find-one-node --nodeId $VSCODE --format json --profile admin )
V17=$(echo $NODE | jq -br '.item.requiredSkills[] | select( .canister.version == "17.10.163" ) | .canister.version')

if [ -z "${V17}" ]; then
    echo ""
    echo "Please wait the skill sync has not started yet"
    echo ""
    exit 0
fi

echo ""
echo "Required Skills"
echo "----------------------------"

chef-node-management-cli management node find-one-node --nodeId $VSCODE --format json --profile admin | jq '.item.requiredSkills'

echo ""
echo "Installed Skills"
echo "----------------------------"

chef-node-management-cli management node find-one-node --nodeId $VSCODE --format json --profile admin | jq '.item.installedSkills'

echo ""
echo "Habitat Packages"
echo "----------------------------"

hab pkg list chef/chef-infra-client

