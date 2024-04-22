terraform {
  source = "./terraform-aws-athena"
}

inputs = {
  create_s3_bucket = true
  athena_s3_bucket_id = var.create_s3_bucket

  databases = {
    database_name = var.databases
  }

  athena_workgroup_description = var.workgroup_description
}

terraform {
  source = "./terraform-aws-athena"
}

dependency "s3_bucket" {
  config_path = "../athena_output_bucket"
}

dependency "athena_database" {
  config_path = "../example_database"
}

dependency "athena_workgroup" {
  config_path = "../example_workgroup"
}
