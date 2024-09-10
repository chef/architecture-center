#!/bin/bash 

echo "export PLATFORM_NODE_SERVER_URL=\"https://$FQDN\"" > ~/nodes/script.enroll.sh
echo "export PLATFORM_NODE_MANAGEMENT_AGENT_API_KEY=\"$API_KEY\"" >> ~/nodes/script.enroll.sh
echo "export PLATFORM_NODE_MANAGEMENT_AGENT_API_SECRET=\"$API_SECRET\"" >> ~/nodes/script.enroll.sh
echo "sudo curl https://chef-platform-content.s3.us-east-2.amazonaws.com/install.sh | sudo -E bash" >> ~/nodes/script.enroll.sh

echo "scp -rp -i ~/.keys/key-pair.pem  ~/nodes/script.enroll.sh ec2-user@192.168.10.10:/home/ec2-user"  > ~/nodes/enroll.sh
echo "scp -rp -i ~/.keys/key-pair.pem  ~/nodes/script.enroll.sh ec2-user@192.168.10.20:/home/ec2-user" >> ~/nodes/enroll.sh
echo "scp -rp -i ~/.keys/key-pair.pem  ~/nodes/script.enroll.sh ec2-user@192.168.10.30:/home/ec2-user" >> ~/nodes/enroll.sh

echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.10 'chmod +x script.enroll.sh'" >> ~/nodes/enroll.sh
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.20 'chmod +x script.enroll.sh'" >> ~/nodes/enroll.sh
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.30 'chmod +x script.enroll.sh'" >> ~/nodes/enroll.sh

echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.10 './script.enroll.sh'" >> ~/nodes/enroll.sh
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.20 './script.enroll.sh'" >> ~/nodes/enroll.sh
echo "ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.30 './script.enroll.sh'" >> ~/nodes/enroll.sh

chmod +x ~/nodes/enroll.sh
