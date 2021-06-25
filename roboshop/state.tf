terraform {
  backend "s3" {
    bucket                             = "terraform--batch56"
    key                                 = "roboshop/terraform.tfstate"
    region                             = "us-east-1"
    dynamodb_table              = "terraform"
  }
}
