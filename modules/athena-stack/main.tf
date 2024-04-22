module "lambda_functions" {
  source = "/terraform-aws-athena"

resource "aws_s3_bucket" "athena_output_bucket" {
  bucket = var.create_s3_bucket ? var.athena_s3_bucket_id : "desired-bucket-name"
}

resource "aws_athena_database" "example_database" {
  name = var.databases["database_name"]  # Replace "database_name" with the key for your desired database in the databases map
}

resource "aws_athena_workgroup" "example_workgroup" {
  name = var.athena_workgroup_name

  configuration {
    enforce_workgroup_configuration = true
    publish_cloudwatch_metrics_enabled = true
    bytes_scanned_cutoff_per_query  = 1000000000
    requester_pays_enabled          = false

    result_configuration {
      output_location = "s3://${aws_s3_bucket.athena_output_bucket.bucket}/results/"
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
