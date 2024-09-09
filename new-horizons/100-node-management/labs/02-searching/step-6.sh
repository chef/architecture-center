#!/bin/bash

chef-node-management-cli management filter create-filter --body-file step-6.sh.json --format json --profile admin  | jq
