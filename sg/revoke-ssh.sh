#!/bin/bash
set -e

if [[ -z "$SECURITY_GROUP_ID" || -z "$RUNNER_IP" ]]; then
  echo "SECURITY_GROUP_ID or RUNNER_IP is not set"
  exit 1
fi

echo "Revoking access for IP $RUNNER_IP"

aws ec2 revoke-security-group-ingress \
  --group-id "$SECURITY_GROUP_ID" \
  --protocol tcp \
  --port 22 \
  --cidr "$RUNNER_IP/32" \
  --region "$AWS_REGION"

echo "Ingress rule revoked"
