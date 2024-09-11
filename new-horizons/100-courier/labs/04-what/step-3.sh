#!/bin/bash

chef-courier-cli scheduler jobs add-job --body-file step-3.sh.json --format json --profile admin | jq