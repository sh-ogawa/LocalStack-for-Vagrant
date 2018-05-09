#!/bin/bash
aws --endpoint-url=http://localhost:4576 sqs create-queue --queue-name test-queue
