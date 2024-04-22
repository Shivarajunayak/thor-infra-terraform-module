module "step_functions" {
  source = "./terraform-aws-eventbridge"

  # Define the AWS EventBridge rule resource
  resource "aws_cloudwatch_event_rule" "example_rule" {
    name        = var.rule_name
    description = var.rule_description
    event_pattern = jsonencode({
      source = ["aws.ec2"]
      detail_type = ["EC2 Instance State-change Notification"]
      detail = {
        state = ["running"]
      }
    })

    targets {
      id         = "example-target"
      arn        = var.sns_topic_arn
      input_path = "$.detail.instance-id"  # Optional input transformation
    }
  }

  # Output the ARN of the created EventBridge rule
  output "eventbridge_rule_arn" {
    value = aws_cloudwatch_event_rule.example_rule.arn
  }
}
