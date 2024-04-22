module "step_functions" {
  source = "./terraform-aws-step-functions"

  name = var.name

  definition_file = var.definition_file

  role_name = var.role_name
  role_policy_arns = var.role_policy_arns

  task_policy_arns = var.task_policy_arns

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "step_functions" {
  name = "step-functions-${var.name}"

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "step_functions_assume_role" {
  role = module.step_functions.role_name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "step_functions_logs" {
  role = module.step_functions.role_name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}
