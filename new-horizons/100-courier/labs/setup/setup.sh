#!/bin/bash -xe   

mkdir -p /home/ec2-user/nodes
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.10" > /home/ec2-user/nodes/node-1.ssh
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.20" > /home/ec2-user/nodes/node-2.ssh
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.30" > /home/ec2-user/nodes/node-3.ssh

chmod +x /home/ec2-user/nodes/node-1.ssh
chmod +x /home/ec2-user/nodes/node-2.ssh
chmod +x /home/ec2-user/nodes/node-3.ssh


cd templates
./setup-runner.sh
sudo ./configure.sh
