module "dynamodb_table" {
  source   = "./terraform-aws-dynamodb"
  for_each = toset(["one", "two", "three", "four"])
  name       = "table-${each.key}"
  hash_key   = "id"
  attributes = [
    {
      name = "id"
      type = "N"
    }
  ]
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}