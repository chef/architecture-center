#!/bin/bash

chef-node-management-cli management assembly update-assembly --body-file step-4.sh.yaml --skillAssemblyId "5bf1311c-c4b6-420d-bc60-c2bad3c1ef88" --format json --profile admin | jq
