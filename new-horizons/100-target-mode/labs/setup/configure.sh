mkdir /home/ec2-user/nodes
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.10" > /home/ec2-user/nodes/node-1.ssh
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.20" > /home/ec2-user/nodes/node-2.ssh
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.30" > /home/ec2-user/nodes/node-3.ssh

echo "ssh root@192.168.1.30" > /home/ec2-user/nodes/wrt.ssh

mkdir /home/ec2-user/.chef
touch /home/ec2-user/.chef/credentials
echo "['node-1']" >> /home/ec2-user/.chef/credentials
echo "host='192.168.10.10'" >> /home/ec2-user/.chef/credentials
echo "user='ec2-user'" >> /home/ec2-user/.chef/credentials
echo "key_files='~/.keys/key-pair.pem'" >> /home/ec2-user/.chef/credentials

echo "['node-2']" >> /home/ec2-user/.chef/credentials
echo "host='192.168.10.20'" >> /home/ec2-user/.chef/credentials
echo "user='ec2-user'" >> /home/ec2-user/.chef/credentials
echo "key_files='~/.keys/key-pair.pem'" >> /home/ec2-user/.chef/credentials

echo "['node-3']" >> /home/ec2-user/.chef/credentials
echo "host='192.168.10.30'" >> /home/ec2-user/.chef/credentials
echo "user='ec2-user'" >> /home/ec2-user/.chef/credentials
echo "key_files='~/.keys/key-pair.pem'" >> /home/ec2-user/.chef/credentials

echo "['openwrt']" >> /home/ec2-user/.chef/credentials
echo "host='192.168.0.30'" >> /home/ec2-user/.chef/credentials
echo "user='root'" >> /home/ec2-user/.chef/credentials
echo "password='target-mode'" >> /home/ec2-user/.chef/credentials