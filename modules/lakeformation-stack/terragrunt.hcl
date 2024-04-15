terraform {
  source = "./terraform-aws-lakeformation"
}

inputs = {
  database_name              = "example_database"
  admin_data_lake_principal = "arn:aws:iam::123456789012:user/admin"
  trusted_data_lake_principals = ["arn:aws:iam::123456789012:role/trusted_role"]
  trusted_glue_principals = ["arn:aws:iam::123456789012:role/trusted_glue_role"]
  trusted_glue_crawlers = ["crawler_name"]
  workflow_names = ["workflow_name"]
  data_location = "s3://example_bucket"
  admin_results_bucket = "admin_bucket_name"
  delete_default_admin_result_bucket = false
  workflow_creation_date = "2022-03-01"
  workflow_state = "ENABLED"
  workflow_last_modified = "2022-03-01"
  workflow_last_run = "2022-03-01"
  workflow_description = "Example workflow"
  admin_results_database = "admin_results_database"
  grantable_permissions = ["ALL", "SELECT"]
  table_permission_data = {
    table_name = "example_table"
    principal = "arn:aws:iam::123456789012:role/trusted_role"
    permissions = ["ALL", "SELECT"]
  }
  column_permission_data = {
    database_name = "example_database"
    table_name    = "example_table"
    column_names  = ["example_column"]
    principal     = "arn:aws:iam::123456789012:role/trusted_role"
    permissions   = ["SELECT"]
  }
  user_permission_data = {
    user_name     = "example_user"
    principal     = "arn:aws:iam::123456789012:role/trusted_role"
    permissions   = ["ALL", "SELECT"]
  }
}

tags = {
 Terraform	= "true"
 Environment	= "dev"
}

