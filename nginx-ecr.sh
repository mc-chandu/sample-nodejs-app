#!/bin/sh
ACCOUNT_ID="280173693189"
AWS_DEFAULT_REGION="us-east-1"
REPOSITORY_URI="$ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/demo-01"
IMAGE_REPO_NAME="demo-nginx"
docker pull nginx:latest
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $REPOSITORY_URI 
docker tag nginx:latest $REPOSITORY_URI/$IMAGE_REPO_NAME:latest
docker push $REPOSITORY_URI/$IMAGE_REPO_NAME:latest

#aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 280173693189.dkr.ecr.us-east-1.amazonaws.com
