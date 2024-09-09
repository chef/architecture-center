#!/bin/bash -xe   

mkdir -p /home/ec2-user/nodes
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.10" > /home/ec2-user/nodes/node-1.ssh
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.20" > /home/ec2-user/nodes/node-2.ssh
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.30" > /home/ec2-user/nodes/node-3.ssh

chmod +x /home/ec2-user/nodes/node-1.ssh
chmod +x /home/ec2-user/nodes/node-2.ssh
chmod +x /home/ec2-user/nodes/node-3.ssh


curl -sk http://workshop.chef360.io/platform/bundledtools/v1/static/install.sh | TOOL="chef-platform-auth-cli" SERVER="http://workshop.chef360.io" VERSION="latest" bash -
curl -sk http://workshop.chef360.io/platform/bundledtools/v1/static/install.sh | TOOL="chef-node-management-cli" SERVER="http://workshop.chef360.io" VERSION="latest" bash -
curl -sk http://workshop.chef360.io/platform/bundledtools/v1/static/install.sh | TOOL="chef-courier-cli" SERVER="http://workshop.chef360.io" VERSION="latest" bash -

curl http://workshop.chef360.io:8080/credentials > .chef-platform/credentials
curl http://workshop.chef360.io:8080/credentials > .chef-platform/credentials

#cd templates
#./setup-runner.sh
#cd ..

#sudo ./configure.sh
#./enroll.sh
