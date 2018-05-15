#!/bin/bash
aws --endpoint-url=http://localhost:4572 s3api put-bucket-notification-configuration \
    --bucket local-test-bucket --notification-configuration '{
  "QueueConfigurations": [
    {
      "Id":"test-event",
      "QueueArn": "http://localhost:4576/queue/test",
      "Events": ["s3:ObjectCreated:*"]
    }
  ]
}'
