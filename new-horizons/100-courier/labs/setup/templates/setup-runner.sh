#!/bin/bash 

if [ -z "$API_KEY" ]; then
  echo "API_KEY is not configured"
  exit 1
fi

if [ -z "$API_SECRET" ]; then
  echo "API_SECRET is not configured"
  exit 1
fi

if [ -z "$PASSPHRASE" ]; then
  echo "PASSPHRASE is not configured"
  exit 1
fi

if [ -z "$USER" ]; then
  echo "PASSPHRASE is not configured"
  exit 1
fi

if [ -z "$FQDN" ]; then
  echo "PLATFORM_URL is not configured"
  exit 1
fi

PLATFORM_URL="https://$FQDN"

#set -x
#KEY=$3                  #"apiuser"
#SECRET=$4               #"b15606a050a60b5f"
#SERVER=$1               #"http://192.168.1.10"
#PUBLIC_SERVER=$5    #"https://my.demo.chef.co"

# --------------
# Runner
sed -i "s|--API-KEY--|${API_KEY}|g" courier-runner-default-settings.json 
sed -i "s|--API-SECRET--|${API_SECRET}|g" courier-runner-default-settings.json 
sed -i "s|--SERVER--|${PLATFORM_URL}|g" courier-runner-default-settings.json 

TEMPLATE=$(cat courier-runner.tmpl | base64 -w 0)
sed -i "s|--TEMPLATE--|${TEMPLATE}|g" courier-runner.json

echo "CREATE Courier Runner"
cat courier-runner.json
curl -X POST -H "api-key: $API_KEY" -H "api-secret: $API_SECRET" -H "Content-Type: application/json" -d @"courier-runner.json" ${PLATFORM_URL}/v1/skills/

echo "CREATE Courier Runner Default settings"
cat courier-runner-default-settings.json
curl -X PUT -H "api-key: $API_KEY" -H "api-secret: $API_SECRET" -H "Content-Type: application/json" -d @"courier-runner-default-settings.json" ${PLATFORM_URL}/v1/default-settings/skill/courier-runner

echo "CREATE Courier Runner linux settings"
cat courier-runner-linux-settings.json
curl -X POST -H "api-key: $API_KEY" -H "api-secret: $API_SECRET" -H "Content-Type: application/json" -d @"courier-runner-linux-settings.json" ${PLATFORM_URL}/v1/settings/

echo "CREATE Courier Runner windows settings"
cat courier-runner-windows-settings.json
curl -X POST -H "api-key: $API_KEY" -H "api-secret: $API_SECRET" -H "Content-Type: application/json" -d @"courier-runner-windows-settings.json" ${PLATFORM_URL}/v1/settings/


echo "*********************** START GOHAI"
# --------------
# Gohai
sed -i "s|--API-KEY--|${API_KEY}|g" chef-gohai-default-settings.json 
sed -i "s|--API-SECRET--|${API_SECRET}|g" chef-gohai-default-settings.json 
sed -i "s|--SERVER--|${PLATFORM_URL}|g" chef-gohai-default-settings.json 

TEMPLATE=$(cat chef-gohai.tmpl | base64 -w 0)
sed -i "s|--TEMPLATE--|${TEMPLATE}|g" chef-gohai.json

echo "CREATE Chef gohai"
cat chef-gohai.json
curl -X POST -H "api-key: $API_KEY" -H "api-secret: $API_SECRET" -H "Content-Type: application/json" -d @"chef-gohai.json" ${PLATFORM_URL}/v1/skills/

echo "CREATE Chef gohai default settings"
cat chef-gohai-default-settings.json
curl -X PUT -H "api-key: $API_KEY" -H "api-secret: $API_SECRET" -H "Content-Type: application/json" -d @"chef-gohai-default-settings.json" ${PLATFORM_URL}/v1/default-settings/skill/chef-gohai

# --------------
# Shell
echo "CREATE Courier-shell-interpreter"
cat courier-shell-interpreter.json
curl -X POST -H "api-key: $API_KEY" -H "api-secret: $API_SECRET" -H "Content-Type: application/json" -d @"courier-shell-interpreter.json" ${PLATFORM_URL}/v1/skills/
