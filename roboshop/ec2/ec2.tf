resource "aws_spot_instance_request" "cheap_worker" {
  ami                                         = "ami-059e6ca6474628ef0"
  spot_price                               = "0.0036"
  instance_type                          = "t2.micro"

  tags = {
    Name                                   = "sample"
  }
}

## u can find the "aws spot instance terraform" -- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/spot_instance_request to launch instances by using spot request..