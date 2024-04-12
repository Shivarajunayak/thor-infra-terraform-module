module "lambda_functions" {
  source = "./terraform-aws-s3-bucket"

  resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = var.acl
  }

tags = {
        Terraform   = "true"
        Environment = "dev"
      }

