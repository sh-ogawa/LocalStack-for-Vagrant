#!/bin/bash
aws --endpoint-url=http://localhost:4572 s3api put-bucket-notification-configuration \
    --bucket test --notification-configuration '{
  "QueueConfigurations": [
    {
      "Id":"test-event",
      "QueueArn": "arn:aws:sqs:elasticmq:foobar:test",
      "Events": ["s3:ObjectCreated:*"]
    }
  ]
}'
