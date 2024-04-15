terraform {
  source = "./terraform-aws-athena"
}

# Include common settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

inputs = {
  # Define input variables for the Athena module
  # For example:
  region          = "us-west-2"
  s3_output_bucket = "example-output-bucket"
}

