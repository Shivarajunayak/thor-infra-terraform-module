terraform {
  source = "./terraform-aws-athena"
}

resource "aws_s3_bucket" "athena_output_bucket" {
  bucket = "example-athena-output-bucket"  # Replace with your desired bucket name
  acl    = "private"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "example-project"
  }
}

resource "aws_athena_database" "example_database" {
  name        = "example_database"  # Replace with your desired database name
  description = "Example Athena database"  # Optional description

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "example-project"
  }
}

resource "aws_athena_workgroup" "example_workgroup" {
  name = "example_workgroup"  # Replace with your desired workgroup name

  configuration {
    enforce_workgroup_configuration = true
    publish_cloudwatch_metrics       = "DISABLED"  # Optional: Change as needed
    bytes_scanned_cutoff_per_query  = 1000000000  # Example value, adjust as needed
    requester_pays_enabled          = false       # Example value, adjust as needed
    result_configuration {
      output_location = "s3://${aws_s3_bucket.athena_output_bucket.bucket}/results/"
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
