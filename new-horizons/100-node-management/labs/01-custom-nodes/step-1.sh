#!/bin/bash

chef-node-management-cli management node find-all-nodes --format json --profile admin | jq '[ .items[] | {id: .id, healthStatus: .healthStatus, enrollmentLevel: .enrollmentLevel, checkedInAt: .checkedinAt} ]'