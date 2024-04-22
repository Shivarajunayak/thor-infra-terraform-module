module "lambda_functions" {
  source = "./terraform-aws-s3-bucket"

  bucket = var.bucket
  acl    = var.acl
  

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}