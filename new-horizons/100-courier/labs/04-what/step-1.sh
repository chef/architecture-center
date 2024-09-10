#!/bin/bash

chef-courier-cli scheduler jobs add-job --body-file step-1.sh.json --format json --profile admin | jq