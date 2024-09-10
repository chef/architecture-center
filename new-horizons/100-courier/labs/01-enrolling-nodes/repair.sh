ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.10 'bash -s' < force-rotation.script
ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.20 'bash -s' < force-rotation.script
ssh -i ~/.keys/key-pair.pem ec2-user@192.168.10.30 'bash -s' < force-rotation.script
