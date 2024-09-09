#!/bin/bash

NODE=$(chef-node-management-cli management node find-one-node --nodeId $VSCODE --format json --profile admin )
AWS=$(echo $NODE | jq -br '.item.installedSkills[] | select( .name == "aws-cli" ) | .name')
DOCKER=$(echo $NODE | jq -br '.item.installedSkills[] | select( .name == "docker" ) | .name')

if [ -z "${AWS}" ]; then
    echo ""
    echo "Please wait the skill sync has not started yet"
    echo ""
    exit 0
fi

if [ -z "${DOCKER}" ]; then
    echo ""
    echo "Please wait the skill sync has not started yet"
    echo ""
    exit 0
fi

echo ""
echo "Installed AWS CLI Version: "
echo "---------------------------"

echo $NODE | jq '.item.installedSkills[] | select( .name == "aws-cli" ) | .'

echo ""
echo "Installed Docker Version: "
echo "---------------------------"

echo $NODE | jq '.item.installedSkills[] | select( .name == "docker" ) | .'
