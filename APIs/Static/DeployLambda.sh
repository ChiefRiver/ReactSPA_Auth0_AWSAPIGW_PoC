#!/bin/bash
cd Function && zip -r static.zip * && aws lambda update-function-code --function-name kickitsoon-dev-Lambda-static --zip-file fileb://static.zip --region us-east-1 && rm static.zip

