module "cloudfront_distribution" {
  source  = "./terraform-aws-cloudfront"

  default_cache_behavior = {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "my-s3-origin"
    viewer_protocol_policy = "allow-all"
    # Assuming domain_name is the S3 bucket domain name
    # Update this with the correct value if needed
    forwarded_values = {
      query_string = false
    }
  }

  # Assuming domain_name is the S3 bucket domain name
  # Update this with the correct value if needed
  aliases = [domain_name]

  viewer_certificate = {
    cloudfront_default_certificate = true
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "cloudfront_origin_access_identity" {
  source = "./terraform-aws-cloudfront-origin-access-identity"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
