#!/bin/bash

apt install jq -y

# awslocal lambda delete-function --function-name my-function

# awslocal lambda create-function \
# --function-name my-function \
# --runtime nodejs14.x \
# --role dummy \
# --handler index.handler \
# --zip-file fileb:///init/data/my-function.zip

awslocal lambda list-functions

# awslocal lambda invoke \
# --function-name my-function \
# --payload '{ "query": "{}" }' \
# --log-type Tail \
# --query 'LogResult' \
# --output text \
# log.txt |  base64 -d

# awslocal apigatewayv2 create-api \
# --name my-api \
# --protocol-type HTTP \
# --target arn:aws:lambda:us-east-1:000000000000:function:my-function

# awslocal apigateway create-rest-api --name my-api \
# | tee create-rest-api.json
# REST_API_ID=$(jq '.id' create-rest-api.json)
# echo $REST_API_ID

# awslocal apigateway get-resources --rest-api-id $REST_API_ID \
# | tee get-resources.json
# PARENT_ID=$(jq '.items[0].id' get-resources.json)
# echo $PARENT_ID

# awslocal apigateway create-resource \
# --rest-api-id $REST_API_ID \
# --parent-id $PARENT_ID \
# --path-part graphql \
# | tee create-resource.json
# RESOURCE_ID=$(jq '.id' create-resource.json)
# echo $RESOURCE_ID

# awslocal apigateway put-integration \
# --rest-api-id $REST_API_ID \
# --resource-id $RESOURCE_ID \
# --http-method POST \
# --type AWS \
# --integration-http-method POST \
# --uri arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:123456789012:function:HelloWorld/invocations \
# --request-templates file://path/to/integration-request-template.json \
# --credentials arn:aws:iam::123456789012:role/apigAwsProxyRole
