#!/bin/bash
if [ -n "$STUDIO_TYPE" ]; then
    echo "Must be run from outside of Habitat Studio please exit"
    exit -1
fi

sudo docker run --rm -e HAB_LICENSE="accept-no-persist" -e CHEF_LICENSE="accept-no-persist" --entrypoint '/bin/hab' chef/chef-infra-client 'pkg' 'exec' 'chef/chef-infra-client' 'chef-client' 