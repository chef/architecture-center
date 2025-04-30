#!/bin/bash
clear
echo ""
echo "Installed Skills on Workstation ($VSCODE)"
echo "--------------------------------------------------------------------------"
chef-node-management-cli management node find-one-node --nodeId $VSCODE --format json --profile admin | jq '.item.installedSkills[]'
