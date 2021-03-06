## terraform init
## terraform plan
## terraform apply to avoid ask yes or no to terraform apply -auto-approve
## if you want not need terraform destroy

output "sample" {
  //value = "Hello World"
  value = var.sample
}
## so in this u can give "hai everyone" in  outputs from  variable data

output "sample1" {
  //value = "Hello World1"
  //value = "${var.sample}"
  value = "${var.sample} Good morning"
}

variable "sample" {
  default = "hai everyone"
}

## Variable sample can be accessed as var.sample or ${var.sample}, However
## var.sample is used without quotes
## ${var.sample} is used within quotes.
## if  we use in ${} it can show in underline,So Usually ${} used only when you combine with some other data

# String Data type
variable "sample1" {
  default = "Hello World"
}
## Single quotes does not support by terraform at any level. Supports only double quotes.

# Number data type
variable "sample2" {
  default = 100
}

# Boolean Data type
variable "sample3" {
  default = true
}
## List is in always shows in  square brackets in terraform..
variable "sample4" {
  default =  [
    "Hai",
    1000,
    true,
    "World"
  ]
}

output "sample4" {
  value = var.sample4[1]
}
# here 0 means first line(Hai),1 means Second line (1000)....
variable "sample5" {
  default =  {
    string = "Hai",
    number = 100,
    boolean = true
  }
}
# Terraform can also supports the different data types in single list or map variable,Need not to be the same data type...means string,list,boolean is not needed same data..
output "sample5" {
  value = var.sample5["boolean"]
}
## in Amazon  100 and more services are there,,Terraform will handle with all those services

variable "sample6" {}

output "sample6" {
  value = var.sample6
}

variable "ENV" {}

output "ENV" {
  value = var.ENV
}

##  u have to exclusivly tell that in putty git pull ; terraform apply -auto-approve -var-file=dev.tfvars
## if any changes are added so edit like this  export IF_VAR_ENV=any name(MADHU or DEvOps) any name will add to that command then  git pull ; terraform apply -auto-approve
## Variable types -- Default type,List type,Map variable type..
## Terraform supports  200+ providers(registery.terraform.IO website u can check privders)...if u work aws provider and u wrk in another provider at the same time,then u have to mention as "alias"
## in terraform keys is called as arguments,and values is called as attributes