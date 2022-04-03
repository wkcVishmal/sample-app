# Introduction

This repository contains a simple Python Django Hello-world application and AWS Cloudformation automation code to set up the AWS infrastructure from the scratch.

Both the sample app and the Jenkins service have been dockerized and deployed using AWS ECS. AWS RDS PostgreSQL server is used as the database of the sample web application.

## Installation

Install the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) and set up the AWS credentials.

### 1. Create the cloudformation stack using cloudformation.yaml file.
![create cloudformation stack](/images/cfn.jpg "CFN")
### 2. Build and push the Jenkins ECR image.
Go to the porject path and run the start.sh file to run the automation

```bash
sh push-jenkins.sh
```
### 3. Login to the jenkins and create a new pipeline
![setting up source](/images/jenkins1.jpg "Source")
![Jenkinsfile](/images/jenkins2.jpg "Source")

### 4. Run the Jenkins pileline to deploy the sample-app
