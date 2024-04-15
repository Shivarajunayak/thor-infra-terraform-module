 module "acm" {

  source = "./terraform-aws-acm"

  domain_name       = "example.com"
  validation_method = "DNS"

  tags = {
    Name        = "example_acm_certificate"
    Terraform   = "true"
    Environment = "dev"
  }
}
