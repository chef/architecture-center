#!/bin/bash -xe   
if [ "$EUID" -ne 0 ]
  then echo "script must run as root"
  exit
fi

echo "creating /opt/demo"
mkdir -p /opt/demo
cp -r cmd/* /opt/demo
chown -R ec2-user:ec2-user /opt/demo
chmod a+x /opt/demo/*

echo "bin linking demo"
#ln -s /opt/demo/chef /usr/bin/
ln -s /opt/demo/node /usr/bin/
ln -s /opt/demo/courier /usr/bin/


# export PLATFORM_NODE_SERVER_URL="https://t122.demos.chef.co"
# export PLATFORM_NODE_MANAGEMENT_AGENT_API_KEY="workshop"
# export PLATFORM_NODE_MANAGEMENT_AGENT_API_SECRET="be960606155f89a7"
# sudo curl https://chef-platform-content.s3.us-east-2.amazonaws.com/install.sh | sudo -E bash