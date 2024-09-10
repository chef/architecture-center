#!/bin/bash

chef-courier-cli scheduler jobs add-job --body-file step-3.sh.yaml --format json --profile admin | jq