variable "fruits" {
  default = ["banana", "apple", "grapes" ]
}

output "number_of_fruits" {
  value = length(var.fruits)
}

## here length is number of items in that list nothing but count.....