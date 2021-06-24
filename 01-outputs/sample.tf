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
## Usually ${} used only when you combine with some other data
## Single quotes does not support by terraform at any level. Supports only double quotes.