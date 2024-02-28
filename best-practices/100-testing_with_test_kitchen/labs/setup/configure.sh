#!/bin/bash -xe   

curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chef-workstation
sudo yum install docker -y
sudo systemctl start docker