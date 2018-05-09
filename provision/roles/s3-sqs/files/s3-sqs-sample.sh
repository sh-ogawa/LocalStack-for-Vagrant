#!/bin/bash
aws --endpoint-url=http://localhost:4572 s3api put-bucket-notification-configuration \
    --bucket local-test-bucket --notification-configuration file://notification.json
