#!/bin/bash
aws --endpoint-url=http://localhost:4576 sqs create-queue --queue-name test

SQS_QUEUE_URL=$( \
        aws --endpoint-url=http://localhost:4576 sqs get-queue-url \
          --queue-name test \
          --output text \
)

SQS_POLICY='{
 "Version": "2008-10-17",
 "Id": "test",
 "Statement": [
  {
   "Sid": "test",
   "Effect": "Allow",
   "Principal": {
    "AWS":"*"  
   },
   "Action": [
    "SQS:SendMessage"
   ],
   "Resource": "http://localhost:4576/queue/test",
   "Condition": {
      "ArnLike": {          
      "aws:SourceArn": "arn:aws:s3:*:*:test"    
    }
   }
  }
 ]
}'
SQS_POLICY_ESCAPED=$(echo $SQS_POLICY | perl -pe 's/"/\\"/g')
SQS_POLICY_ATTRIBUTES='{"Policy":"'$SQS_POLICY_ESCAPED'"}'

# policyÇê›íËÇ∑ÇÈ
aws --endpoint-url=http://localhost:4576 sqs set-queue-attributes \
  --queue-url ${SQS_QUEUE_URL} \
  --attributes "$SQS_POLICY_ATTRIBUTES"

aws --endpoint-url=http://localhost:4576 sqs get-queue-attributes \
        --queue-url ${SQS_QUEUE_URL} \
        --attribute-names \
          Policy \
          VisibilityTimeout \
          MaximumMessageSize \
          MessageRetentionPeriod \
          ApproximateNumberOfMessages \
          ApproximateNumberOfMessagesNotVisible \
          CreatedTimestamp \
          LastModifiedTimestamp \
          QueueArn \
          ApproximateNumberOfMessagesDelayed \
          DelaySeconds \
          ReceiveMessageWaitTimeSeconds \
          RedrivePolicy

echo "SQS Setting Finish URL: ${SQS_QUEUE_URL}"