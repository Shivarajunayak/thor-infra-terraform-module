terraform {
  source = "./terraform-aws-eventbridge"
}

include {
  path = find_in_parent_folders("vatiable.tf")
}

locals {
  rule_name        = var.rule_name
  rule_description = var.rule_description
  sns_topic_arn    = var.sns_topic_arn
}

