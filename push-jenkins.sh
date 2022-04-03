#!/bin/bash

echo "Enter AWS Account ID"
read account_id

echo "Enter AWS Region"
read region

if [ -z "${account_id}" ] ||  [ -z "${region}" ]; then
    echo "Inputs cannot be empty"
    exit 0
fi

if ! [[ "$account_id" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then 
    echo "Inputs must be a numbers" 
    exit 0 
fi

# AWS ECR login 
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $account_id.dkr.ecr.$region.amazonaws.com

# Build
cd Jenkins && docker build -t jenkins -f Dockerfile .

# Tag
docker tag jenkins:latest $account_id.dkr.ecr.$region.amazonaws.com/jenkins:latest

# Push
docker push $account_id.dkr.ecr.$region.amazonaws.com/jenkins:latest