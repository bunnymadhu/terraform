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

output "fruit value" {
  value = element(var.fruits, 0)
}