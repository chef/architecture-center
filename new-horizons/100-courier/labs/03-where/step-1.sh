#!/bin/bash

chef-courier-cli scheduler jobs add-job --body-file step-1.sh.yaml --format json --profile admin | jq