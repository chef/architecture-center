#!/bin/bash
SSH_KEY=$(awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' ~/.keys/key-pair.pem)
MY_IP=$(TOKEN=`curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

function createFile(){
    name="$1"
    nodeId="$2"
    url="$3"    
    cohortId="$4"    

    >|                                                  "$script_dir/$name.json"
    echo "{" >>                                         "$script_dir/$name.json"
    echo "    \"nodeId\": \"$nodeId\"," >>              "$script_dir/$name.json"
    echo "    \"cohortId\": \"$cohortId\"," >>          "$script_dir/$name.json"
    echo "    \"url\": \"$url\"," >>                    "$script_dir/$name.json"
    echo "    \"sshCredentials\": {" >>                 "$script_dir/$name.json"
    echo "        \"username\": \"ec2-user\"," >>       "$script_dir/$name.json"
    echo "        \"key\": \"$SSH_KEY\"" >>             "$script_dir/$name.json"
    echo "    }" >>                                     "$script_dir/$name.json"
    echo "}" >>                                         "$script_dir/$name.json"

}


createFile "node-1" $NODE1 "192.168.10.10" "436761a5-4bb9-4816-9841-5ff0d474aa17"
createFile "node-2" $NODE2 "192.168.10.20" "436761a5-4bb9-4816-9841-5ff0d474aa17"
createFile "node-3" $NODE3 "192.168.10.30" "436761a5-4bb9-4816-9841-5ff0d474aa17"
createFile "workstation" "$VSCODE" "$MY_IP" "2af4f9b5-254d-4f55-a8f1-c82ed0cdb5db"