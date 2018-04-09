#!/bin/bash
mkdir -p ~/.aws

cat <<EOF >  ~/.aws/credentials
[default]
aws_access_key_id = foobar
aws_secret_access_key = foobar
EOF

cat <<EOF >  ~/.aws/config
[default]
output = json
region = ap-northeast-1
EOF
