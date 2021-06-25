resource "aws_spot_instance_request" "cheap_worker" {
  count                                      = length(var.COMPONENTS)
  ami                                         = "ami-059e6ca6474628ef0"
  spot_price                               = "0.0036"
  instance_type                          = "t2.micro"

  tags                                       = {
    Name                                   = element(var.COMPONENTS, count.index)
  }
}

## u can find the "aws spot instance terraform" -- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/spot_instance_request to launch instances by using spot request..

variable "COMPONENTS" {}

## here count is required bcz  var.COMPONENTS it will create instances from  frontend-payment
## and in tag==Name first placed here is sample so 10 spot requests will created in the name of sample,so by avoiding that we will put element(var.COMPONENTS)..

resource "time_sleep" "wait" {
  depends_on                         = [aws_spot_instance_request.cheap_worker]
  create_duration                    = "120s"
}
## we can give time here for to create instances at that particular names...means var.COMPONENTS

resource "aws_ec2_tag" "spot" {
  count                                  = length(var.COMPONENTS)
  resource_id                        = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
  key                                    = "Name"
  value                                  = element(var.COMPONENTS, count.index)
}
## here * means it is list so 10 instances created it is going to be all the spot instances will create as a list..