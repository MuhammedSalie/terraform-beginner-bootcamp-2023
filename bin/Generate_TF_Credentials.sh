#!/usr/bin/env bash

# Check if the TERRAFORM_CLOUD_TOKEN environment variable is set
if [ -z "$TERRAFORM_CLOUD_TOKEN" ]; then
    echo "Error: TERRAFORM_CLOUD_TOKEN environment variable is not set."
    exit 0
fi

# Define the content of the credentials.tfrc.json file
credentials_json='{
  "credentials": {
    "app.terraform.io": {
      "token": "'"$TERRAFORM_CLOUD_TOKEN"'"
    }
  }
}'

# Write the JSON content to credentials.tfrc.json
mkdir /home/gitpod/.terraform.d/
echo "$credentials_json" > /home/gitpod/.terraform.d/credentials.tfrc.json

echo "/home/gitpod/.terraform.d/credentials.tfrc.json file has been created."
