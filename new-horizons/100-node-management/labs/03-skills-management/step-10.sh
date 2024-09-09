#!/bin/bash
PKG1=$(sudo hab pkg install chef/chef-infra-client/17.10.163)
PKG2=$(sudo hab pkg install chef/chef-infra-client/16.18.30)

watch --chgexit hab pkg list chef/chef-infra-client

echo ""
echo "All packages removed as expected"
echo "----------------------------------"
echo "Remaining chef infra packages:"
echo ""
hab pkg list chef/chef-infra-client
echo ""
echo ""