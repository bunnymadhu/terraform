data "aws_dynamodb_table" "table" {
  name = "terraform"
}

output "table" {
  value = data.aws_dynamodb_table.table
}

## DATA in terraform is to  find out the particular data and output is that print all the data for that  particular table....
## here not only terraform_aws_DynamoDB_Data Sources but also any data in terraform to findout the by using this DATA.....
##