//module "template" {
//  source = "./launch-template"
//}

module "ec2" {
  source = "./ec2"
}

## then go to template.tf and give output to use this module(frontend) by using new  launch-template_id