#!/bin/bash

ohai=$(which ohai 2>/dev/null)
creds=$(cat ~/.chef/credentials 2>/dev/null)

if [ -z "${ohai}" ]; then
    echo "Ohai is not installed, please install workstation"
    exit 1
fi

if [ -z "${creds}" ]; then
    echo "Chef credentials file was not found please configure"
    exit 1
fi

if [[ $creds == *"openwrt"* ]]; then
  echo "All Required items exist"
else 
    exit 1
fi