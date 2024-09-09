#!/bin/bash
if [ -z "$STUDIO_TYPE" ]; then
    echo "Must be run from Habitat Studio"
    exit -1
fi

newest_file_matching_pattern(){ 
    find $1 -name "$2" -print0 | xargs -0 ls -1 -t | head -1  
} 

file=$(newest_file_matching_pattern "/src" "chef-chef-infra-client-18.5.0-*.tar.gz") 

tar -xf $file --overwrite 

echo "Extracted Chef Infra Client"