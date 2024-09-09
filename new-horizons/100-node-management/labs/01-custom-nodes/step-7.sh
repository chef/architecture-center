#!/bin/bash

OHAI=$(ohai -t openwrt)
BODY=$(echo $OHAI | jq '[  { name:"kernel_name",  value: "Linux" },  { name:"platform",  value: .platform },  { name:"os",  value: .os_release.pretty_name}, { name:"version",  value: .os_release.version } , { name:"arch",  value: .os_release.openwrt_arch } , { name:"timezone",  value: .time.timezone } , { name:"fips",  value: .fips.kernel.enabled|tostring },  { name:"manufacturer",  value: .os_release.openwrt_device_manufacturer },  { name:"product_line",  value: .os_release.openwrt_device_product },  { name:"release",  value: .os_release.openwrt_release }  ]')
chef-node-management-cli management node update-attributes --body "$BODY" --body-format json --namespace "ohai" --nodeId $WRT --format json --profile admin | jq

