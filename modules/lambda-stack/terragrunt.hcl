terraform {
  source = "./terraform-aws-lambda"
}

inputs = {
  function_name = "my_lambda_function"
  handler      = "index.handler"
  runtime      = "nodejs14.x"
  role         = "arn:aws:iam::123456789012:role/lambda-role"
  filename     = "lambda_function.zip"
  region       = "us-east-1"
}
