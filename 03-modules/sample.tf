# https://www.terraform.io/docs/language/modules/sources.html for terraform module sources..
module "ec2" {
  source       = "./ec2"
  sg_id         = module.securitygroup.sg_id
}
## from this sg_id input should be accepted variable in ec2.tf

module "securitygroup" {
  source = "./securitygroup"
}

provider "aws" {
  region  = "us-east-1"
}