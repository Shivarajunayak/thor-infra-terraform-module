module "lambda_functions" {
  source = "./terraform-aws-lambda"

resource "aws_opensearch_domain" "example" {
  domain_name           = var.domain_name
  engine_version        = var.engine_version

  cluster_config {
    instance_type = var.instance_type
    instance_count = var.instance_count
  }

  domain_endpoint_options {
    enforce_https = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  ebs_options {
    ebs_enabled = true
    volume_type = "gp2"
    volume_size = var.volume_size
  }

  node_to_node_encryption {
    enabled = true
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
