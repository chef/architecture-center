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
ln -s /opt/demo/chef /usr/bin/
ln -s /opt/demo/node /usr/bin/
ln -s /opt/demo/courier /usr/bin/