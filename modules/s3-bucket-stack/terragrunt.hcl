terraform {
  source = "./terraform-aws-s3-bucket"
}

inputs = {
  bucket_name = var.bucket_name
  acl         = var.acl
  tags        = var.tags
}
