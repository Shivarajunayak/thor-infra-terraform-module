module "cloudfront_distribution" {
  source  = "./terraform-aws-cloudfront"

  origin_config_s3 = {
    origin_id = "my-s3-origin"
    s3_origin_config = {
      origin_access_identity = module.cloudfront_origin_access_identity.cloudfront_origin_access_identity_iam_arn
    }
  }

  default_cache_behavior = {
    allowed_methods = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "my-s3-origin"
    viewer_protocol_policy = "allow-all"
  }

  aliases = [var.domain_name]

  viewer_certificate = {
    cloudfront_default_certificate = true
  }
}

module "cloudfront_origin_access_identity" {
  source = "./terraform-aws-cloudfront"

tags = {
        Terraform   = "true"
        Environment = "dev"
      }

}
