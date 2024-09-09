#!/bin/bash

chef-node-management-cli management filter run-adhocFilter --body-file step-5.sh.yaml --format json --profile admin  | jq '[ .items[] | {id: .id, healthStatus: .healthStatus, enrollmentLevel: .enrollmentLevel, checkedInAt: .checkedinAt} ]'
