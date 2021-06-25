//module "template" {
//  source = "./launch-template"
//}

module "ec2" {
  source                     = "./ec2"
  COMPONENTS        = var.COMPONENTS
}

## then go to template.tf and give output to use this module(ec2) by using new  launch-template_id
## here COMPONENT is a input and this  will use in roboshop_ec2  and there put output by using this input