#!/bin/bash
clear
TEMPLATE=$(chef-node-management-cli management skill find-one-skill --skillName courier-runner | jq -brc '.item.configurationTemplates[] | select( .name == "courier-runner-template" ) | .content')

echo ""
echo "BASE64 encoded file"
echo "---------------------------------"
echo $TEMPLATE



echo ""
echo "Decoded Configuration File"
echo "---------------------------------"
echo $TEMPLATE | base64 --decode




echo ""
echo "Skill Configuration Setting"
echo "---------------------------------"
chef-node-management-cli management setting get-skillSettings --skillName courier-runner --settingId fbc520b3-df0d-45f8-9ef3-66ba9339f1a5 | jq '.item.settings[] | select (.value != "")'