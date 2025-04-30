#!/bin/bash

NODE=$(chef-node-management-cli management node find-one-node --nodeId $VSCODE --format json --profile admin )
ANSIBLE=$(echo $NODE | jq -br '.item.installedSkills[] | select( .name == "ansible" ) | .name')

if [ -z "${ANSIBLE}" ]; then
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
echo "Habitat Packages"
echo "----------------------------"

hab pkg list core/ansible
