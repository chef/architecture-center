#!/bin/bash

    chef-node-management-cli management assembly update-assembly --body-file step-2.sh.yaml --skillAssemblyId "47b32704-6cc7-4bbd-978a-646984e9658b" --format json --profile admin | jq
