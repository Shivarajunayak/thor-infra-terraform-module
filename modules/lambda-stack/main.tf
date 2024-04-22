module "lambda" {
  source  = "./terraform-aws-lambda"

  description   = var.description
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  lambda_role   = var.lambda_role
  lambda_at_edge = var.lambda_at_edge

tags = {
        Terraform   = "true"
        Environment = "dev"
      }
    }

