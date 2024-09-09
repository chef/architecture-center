#!/bin/bash

chef-node-management-cli enrollment enroll-node --body-file node-1.json --format json --profile admin 
chef-node-management-cli enrollment enroll-node --body-file node-2.json --format json --profile admin 
chef-node-management-cli enrollment enroll-node --body-file node-3.json --format json --profile admin 
