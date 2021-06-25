resource "aws_launch_template" "template" {
  name                                   = "template-for-roboshop"
  image_id                              = "ami-059e6ca6474628ef0"
  instance_market_options {
    market_type                       = "spot"
  }
  instance_type                      = "t3.micro"
  vpc_security_group_ids       = ["sg-01d1633aaca167f8e"]
}

## u can find this path https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template and the above information...
## in above ami_id is in my AWS server  ami id and sg id also allow-all-to-internet group id in my AWS server....copy from that to here..

 ## here giving output for  roboshop---ec2.tf becz new template are added so by creating new instance by using this new template_id..

output "template_id" {
  value = aws_launch_template.template.id
}