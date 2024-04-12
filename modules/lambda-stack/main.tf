module "lambda" {
  source  = "./terraform-aws-lambda"

  function_name = var.function_name
  handler      = var.handler
  runtime      = var.runtime
  role         = var.role
  filename     = var.filename

tags = {
        Terraform   = "true"
        Environment = "dev"
      }
    }

