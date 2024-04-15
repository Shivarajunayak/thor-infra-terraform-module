terraform {
  source = "./terraform-aws-acm"
}

inputs = {
  domain_name = "example.com"
  validation_method = "DNS"

  tags = {
    Name        = "example_acm_certificate"
    Terraform   = "true"
    Environment = "dev"
  }
}
