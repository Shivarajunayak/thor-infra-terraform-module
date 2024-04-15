terraform {
  source = "./terraform-aws-cloudfront"
}

inputs = {
  distribution_config = {
    enabled             = true
    default_root_object = "index.html"
    comment             = "My CloudFront Distribution"
    aliases             = ["example.com", "www.example.com"]
    default_cache_behavior = {
      target_origin_id       = "my-s3-bucket-origin"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods        = ["GET", "HEAD", "OPTIONS"]
      cached_methods         = ["GET", "HEAD"]
      forwarded_values       = {
        query_string = false
        cookies      = {
          forward = "none"
        }
      }
      min_ttl                    = 0
      default_ttl                = 3600
      max_ttl                    = 86400
    }
    ordered_cache_behavior = []
    restrictions           = {
      geo_restriction = {
        restriction_type = "none"
      }
    }
    viewer_certificate = {
      cloudfront_default_certificate = true
    }
    tags = {
       Terraform   = "true"
       Environment = "dev"
    }
  }
}

