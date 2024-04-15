module "lakeformation" {
  source = "./terraform-aws-lakeformation"

# Lake Formation data lake
resource "aws_lakeformation_data_lake_settings" "example" {
  admin_user_arn = "arn:aws:iam::123456789012:user/admin"
}

# Lake Formation database
resource "aws_lakeformation_database" "example" {
  name = "example_database"
}

# Lake Formation data location
resource "aws_lakeformation_data_location" "example" {
  database_name   = aws_lakeformation_database.example.name
  s3_location     = "s3://example_bucket"
}

# Lake Formation table permission
resource "aws_lakeformation_permissions" "example_table_permission" {
  database_name = aws_lakeformation_database.example.name
  table_name    = "example_table"
  principal     = "arn:aws:iam::123456789012:role/trusted_role"
  permissions   = ["SELECT"]
}

# Lake Formation column permission
resource "aws_lakeformation_permissions" "example_column_permission" {
  database_name = aws_lakeformation_database.example.name
  table_name    = "example_table"
  column_names  = ["example_column"]
  principal     = "arn:aws:iam::123456789012:role/trusted_role"
  permissions   = ["SELECT"]
}

# Lake Formation user permission
resource "aws_lakeformation_permissions" "example_user_permission" {
  database_name = aws_lakeformation_database.example.name
  user_name     = "example_user"
  principal     = "arn:aws:iam::123456789012:role/trusted_role"
  permissions   = ["ALL", "SELECT"]
}


tags = {
 Terraform	= "true"
 Environment	= "dev"
}


