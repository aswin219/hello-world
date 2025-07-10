#!/bin/bash

set -e

# Ensure SECURITY_GROUP_ID and AWS_REGION are set
if [[ -z "$SECURITY_GROUP_ID" ]]; then
  echo "SECURITY_GROUP_ID is not set"
  exit 1
fi

# Get public IP of GitHub Actions runner
ip=$(curl -s https://ipinfo.io/ip | tr -d '[:space:]')
echo "Runner IP is $ip"
echo "runner_ip=$ip" >> "$GITHUB_OUTPUT"

# Add SSH rule to the security group
aws ec2 authorize-security-group-ingress \
  --group-id "$SECURITY_GROUP_ID" \
  --protocol tcp \
  --port 22 \
  --cidr "$ip/32" \
  --region "$AWS_REGION"

echo "Ingress rule added for $ip/32 on port 22"
