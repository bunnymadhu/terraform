variable "fruits" {
  default = ["banana", "apple", "grapes" ]
}

output "number_of_fruits" {
  value = length(var.fruits)
}

## here length is number of items in that list nothing but count.....
## > length([ ])
## 0
## > length(["a", "b"])
## 2
## > length({"a" = "b"})
## 1
## > length("hello")
## 5

output "fruit-value" {
  value = element(var.fruits, 0)
}

## here element  is value of that particular of item in that list .....
## > element(["a", "b", "c"], 1)
## b
## 0 means first value,1 means 2nd value,2 means 3rd value...
## functions in terraform--https://www.terraform.io/docs/language/functions/element.html