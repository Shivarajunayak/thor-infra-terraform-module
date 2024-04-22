terraform {
  source = "./terraform-aws-dynamodb"
}
 
inputs = {
  name       = "your-table-name" // Provide a fixed name or use a variable
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