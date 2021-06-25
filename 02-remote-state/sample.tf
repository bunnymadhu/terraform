resource "aws_instance" "sample" {
  ami                                    = "ami-059e6ca6474628ef0"
  instance_type                     = "t2.micro"
}

terraform {
  backend "s3" {
    bucket                             = "terraform--batch56"
    key                                 = "sample/terraform.tfstate"
    region                             = "us-east-1"
    dynamodb_table              = "terraform"
  }
}

provider "aws" {
  region                               = "us-east-1"
}

## s3 bucket to store the objects.
## In AWS u cn use DynamoDB and in that create table and give LOCKID and it is a string..
## DynamoDB State Locking
## The following configuration is optional:
## dynamodb_endpoint - (Optional) Custom endpoint for the AWS DynamoDB API. This can also be sourced from the AWS_DYNAMODB_ENDPOINT environment variable.
## dynamodb_table - (Optional) Name of DynamoDB Table to use for state locking and consistency. The table must have a primary key named LockID with type of string. If not configured, state locking will be disabled.

## go cd terraform/02-remote-state and --
## --if u do this above script and  it can show error in instances while creating  instancees then u can opn ls -A and on that .terraform u cn rm -rf on that
## or else in AWS go to IAM and in that roles and give permission to AdministratorAccess and then it will work..

## and finally git pull ; rm -rf .terraform ; terraform init ; terraform apply -auto-approve










