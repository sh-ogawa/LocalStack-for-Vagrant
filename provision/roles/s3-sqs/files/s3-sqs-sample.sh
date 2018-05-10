#!/bin/bash
aws --endpoint-url=http://localhost:4572 s3api put-bucket-notification-configuration \
    --bucket local-test-bucket --notification-configuration '{
  "QueueConfigurations": [
    {
      "Id":"test-event",
      "QueueArn": "arn:aws:sqs:elasticmq:000000000000:test-queue",
      "Events": ["s3:ObjectCreated:Post"],
      "Filter": {
        "Key": {
          "FilterRules": [{ "Name": "suffix","Value": ".jpg" }]
        }
      }
    }
  ]
}'
